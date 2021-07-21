import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';

abstract class GameAction {
  final PlayerColor playerColor;
  GameAction({required this.playerColor});
  bool isPermitted(GameState gameState);
  GameState applyAction(GameState gameState);
}

enum ActionStatus {
  success,
  fail,
}
