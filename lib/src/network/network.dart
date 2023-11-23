import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/network_state.dart';
import 'package:link_five/src/model/store/game_action.dart' as store_action;
import 'package:link_five/src/model/store/game_start.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/network/words.dart';

const _letters = 'abcdefghijklmnopqrstuvwxyz';

class Network {
  FirebaseFirestore? _firestore;

  var _state = NetworkState();
  NetworkState get state => _state;
  var _stateStreamController = StreamController<NetworkState>.broadcast();
  Stream<NetworkState> get stateStream => _stateStreamController.stream;

  Stream<Map<String, Player>>? _playersStream;
  Stream<Map<String, Player>>? get playersStream => _playersStream;

  ActionStatus Function(GameAction)? _applyAction;
  var _currentActionId = '0';

  Future<void> initialize() async {
    await Firebase.initializeApp();
    final auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    if (auth.currentUser == null) {
      await auth.signInAnonymously();
    }

    _setState(state.rebuild((b) => b..userId = auth.currentUser?.uid));
  }

  Future<void> createGame() async => await joinGame(_generateGameCode());

  Future<void> joinGame(String gameCode) async {
    final firestore = _firestore;
    if (firestore == null) return;

    _setState(state.rebuild((b) => b..gameCode = gameCode));

    final random = Random();

    final playersReference = firestore.collection('/games/$gameCode/players');
    final playersSnapshot = await playersReference.get();

    final alreadyJoined =
        (await playersReference.doc(state.userId).get()).exists;

    if (!alreadyJoined) {
      // find an unused color
      final players = playersSnapshot.docs.map((e) => Player.fromMap(e.data()));
      var colors = PlayerColor.values.toSet();
      for (final player in players) {
        colors.remove(player?.color);
      }

      // no unused color, use them all
      if (colors.isEmpty) {
        colors = PlayerColor.values.toSet();
      }

      // set the player
      final player = Player((b) => b
        ..name = _generateName()
        ..color = colors.toList()[random.nextInt(colors.length)]
        ..isReady = false);
      playersReference.doc(state.userId).set(player.toMap()!);
    }

    _listenToPlayerUpdates(playersReference);
    _listenToGameStartUpdates();
  }

  Future<void> changePlayerInfo(Player player) async {
    final firestore = _firestore;
    if (firestore == null) return;

    await _startIfEveryoneReady(player);

    final playersReference =
        firestore.collection('/games/${state.gameCode}/players');

    playersReference.doc(state.userId).set(player.toMap()!);
  }

  Future<void> sendAction(GameAction action) async {
    final firestore = _firestore;
    if (firestore == null) return;

    final actionsReference =
        firestore.collection('/games/${state.gameCode}/game-action');

    final storeAction = _toStoreGameAction(action);

    actionsReference.add(storeAction.toMap()!);
  }

  void setApplyActionCallback(ActionStatus Function(GameAction) applyAction) {
    _applyAction = applyAction;
  }

  void _listenForNextAction(String currentActionId) async {
    final firestore = _firestore;
    if (firestore == null) return;

    _currentActionId = currentActionId;
    final actionsReference =
        firestore.collection('/games/${state.gameCode}/game-action');
    final actionsStream = actionsReference
        .where('basedOn', isEqualTo: currentActionId)
        .snapshots();

    await for (final snapshot in actionsStream) {
      var didSucceed = false;
      final changes = snapshot.docChanges;
      for (final change in changes) {
        final data = change.doc.data();
        if (data != null) {
          final storeAction =
              store_action.GameAction.fromMap(change.doc.data()!)!;
          final actionStatus =
              _applyAction?.call(_fromStoreGameAction(storeAction));
          if (actionStatus == ActionStatus.success) {
            _listenForNextAction(change.doc.id);
            didSucceed = true;
            break;
          }
        }
      }
      if (didSucceed) {
        break;
      }
    }
  }

  void _listenToPlayerUpdates(
      CollectionReference<Map<String, dynamic>> playersReference) async {
    await for (final snapshot in playersReference.snapshots()) {
      final players = MapBuilder<String, Player>();
      for (final doc in snapshot.docs) {
        final converted = Player.fromMap(doc.data());
        if (converted != null) {
          players[doc.id] = Player.fromMap(doc.data())!;
        }
      }
      _setState(state.rebuild((b) => b..players = players));
      final player = players[state.userId];
      if (player != null) {
        _startIfEveryoneReady(player);
      }
    }
  }

  void _listenToGameStartUpdates() async {
    final firestore = _firestore;
    if (firestore == null) return;

    final startGameReference =
        firestore.collection('/games/${state.gameCode}/start-game').doc('0');
    await for (final snapshot
        in startGameReference.snapshots(includeMetadataChanges: true)) {
      if (snapshot.data() != null) {
        final gameStart = GameStart.fromMap(snapshot.data()!);
        if (!snapshot.metadata.hasPendingWrites &&
            gameStart != null &&
            state.players != null) {
          final turnOrder = gameStart.turnOrder;
          _setState(state
              .rebuild((b) => b..turnOrderByUserId = turnOrder.toBuilder()));
          _listenForNextAction('0');
        }
      }
    }
  }

  String _generateGameCode() {
    final random = Random();
    return List.generate(
        6, (index) => _letters[random.nextInt(_letters.length)]).join();
  }

  String _generateName() {
    final random = Random();
    final adjective = adjectives[random.nextInt(adjectives.length)];
    final animal = animals[random.nextInt(animals.length)];
    return '$adjective $animal';
  }

  Future<void> _startIfEveryoneReady(Player thisPlayer) async {
    final firestore = _firestore;
    if (firestore == null) return;

    if (thisPlayer.isReady) {
      final otherPlayersAreReady = state.players?.entries.every(
            (player) => player.value.isReady || player.key == state.userId,
          ) ==
          true;
      if (otherPlayersAreReady) {
        final startGameReference =
            firestore.collection('/games/${state.gameCode}/start-game');
        final startGameDocument = await startGameReference.doc('0').get();
        if (!startGameDocument.exists) {
          final userIds = state.players!.keys.toList();
          final gameStart = GameStart(
              (b) => b..turnOrder = userIds.toBuiltList().toBuilder());
          startGameReference.doc('0').set(gameStart.toMap()!);
        }
      }
    }
  }

  store_action.GameAction _toStoreGameAction(GameAction action) {
    late store_action.GameActionType type;
    store_action.PlaceTileActionBuilder? storePlaceTileAction;
    switch (action.runtimeType) {
      case PlaceTileAction:
        final placeTileActiion = action as PlaceTileAction;
        type = store_action.GameActionType.placeTileAction;
        storePlaceTileAction = store_action.PlaceTileActionBuilder()
          ..location = placeTileActiion.location.toBuilder();
        break;
    }

    return store_action.GameAction(
      (b) => b
        ..basedOn = _currentActionId
        ..userId = state.userId
        ..type = type
        ..placeTileAction = storePlaceTileAction,
    );
  }

  GameAction _fromStoreGameAction(store_action.GameAction storeAction) {
    final userId = storeAction.userId;
    final player = state.players?[userId];

    late PlayerColor color;
    if (player != null) {
      color = player.color;
    }

    late GameAction action;
    switch (storeAction.type) {
      case store_action.GameActionType.placeTileAction:
        action = PlaceTileAction(
          playerColor: color,
          location: storeAction.placeTileAction!.location,
        );
    }

    return action;
  }

  void _setState(NetworkState newState) {
    _state = newState;
    _stateStreamController.add(newState);
  }
}
