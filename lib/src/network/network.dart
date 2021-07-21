import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/network_state.dart';
import 'package:link_five/src/model/network/player.dart';
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

    // listen to player updates
    await for (final snapshot in playersReference.snapshots()) {
      final players = MapBuilder<String, Player>();
      for (final doc in snapshot.docs) {
        final converted = Player.fromMap(doc.data());
        if (converted != null) {
          players[doc.id] = Player.fromMap(doc.data())!;
        }
      }
      _setState(state.rebuild((b) => b..players = players));
    }
  }

  void changePlayerInfo(Player player) {
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

  void _setState(NetworkState newState) {
    _state = newState;
    _stateStreamController.add(newState);
  }
}
