import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';

class Game {
  GameState _state;
  GameState get state => _state;
  final _stateStreamController = StreamController<GameState>.broadcast();
  Stream<GameState> get stateStream => _stateStreamController.stream;

  Game({required List<PlayerColor> turnOrder})
      : _state = GameState(turnOrder.toBuiltList());

  bool isPermitted(GameAction action) {
    if (action.playerColor != _state.currentPlayer) {
      return false;
    }
    return action.isPermitted(_state);
  }

  ActionStatus applyAction(GameAction action) {
    if (action.playerColor != _state.currentPlayer) {
      return ActionStatus.fail;
    }
    if (!action.isPermitted(_state)) {
      return ActionStatus.fail;
    }

    _state = action.applyAction(_state);
    _stateStreamController.add(_state);

    return ActionStatus.success;
  }
}
