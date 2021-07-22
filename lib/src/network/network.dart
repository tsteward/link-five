import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/network_state.dart';
import 'package:link_five/src/model/store/game_start.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/network/words.dart';

const _letters = 'abcdefghijklmnopqrstuvwxyz';

class Network {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var _state = NetworkState();
  NetworkState get state => _state;
  var _stateStreamController = StreamController<NetworkState>.broadcast();
  Stream<NetworkState> get stateStream => _stateStreamController.stream;

  Stream<Map<String, Player>>? _playersStream;
  Stream<Map<String, Player>>? get playersStream => _playersStream;

  Future<void> initialize() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }

    _setState(state.rebuild((b) => b..userId = _auth.currentUser?.uid));
  }

  Future<void> createGame() async => await joinGame(_generateGameCode());

  Future<void> joinGame(String gameCode) async {
    _setState(state.rebuild((b) => b..gameCode = gameCode));

    final random = Random();

    final playersReference = _firestore.collection('/games/$gameCode/players');
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
    final startGameReference =
        _firestore.collection('/games/${state.gameCode}/start-game').doc('0');
    await for (final snapshot in startGameReference.snapshots()) {
      if (snapshot.data() != null) {
        final gameStart = GameStart.fromMap(snapshot.data()!);
        if (gameStart != null && state.players != null) {
          final turnOrder = gameStart.turnOrder;
          _setState(state
              .rebuild((b) => b..turnOrderByUserId = turnOrder.toBuilder()));
        }
      }
    }
  }

  Future<void> changePlayerInfo(Player player) async {
    await _startIfEveryoneReady(player);

    final playersReference =
        _firestore.collection('/games/${state.gameCode}/players');

    playersReference.doc(state.userId).set(player.toMap()!);
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
    if (thisPlayer.isReady) {
      final otherPlayersAreReady = state.players?.entries.every(
            (player) => player.value.isReady || player.key == state.userId,
          ) ==
          true;
      if (otherPlayersAreReady) {
        final startGameReference =
            _firestore.collection('/games/${state.gameCode}/start-game');
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

  void _setState(NetworkState newState) {
    _state = newState;
    _stateStreamController.add(newState);
  }
}
