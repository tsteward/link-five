import 'package:built_collection/built_collection.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game_state.dart';
import 'package:link_five/src/model/player_color.dart';

class Game {
  GameState _gameState;
  GameState get gameState => _gameState;

  Game({required List<PlayerColor> turnOrder})
      : _gameState = GameState(turnOrder.toBuiltList());

  ActionStatus applyAction(GameAction action) {
    if (action.playerColor != _gameState.currentPlayer) {
      return ActionStatus.fail;
    }
    if (!action.isPermitted(_gameState)) {
      return ActionStatus.fail;
    }

    _gameState = action.applyAction(_gameState);

    return ActionStatus.success;
  }
}
