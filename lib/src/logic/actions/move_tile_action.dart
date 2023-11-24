import 'package:link_five/src/logic/actions/action_helpers.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

class MoveTileAction extends GameAction {
  TileLocation source;
  TileLocation destination;

  MoveTileAction({
    required PlayerColor playerColor,
    required this.source,
    required this.destination,
  }) : super(playerColor: playerColor);

  @override
  bool isPermitted(GameState gameState) {
    final isSourceTileCorrect = gameState.tile(source)?.color == playerColor;
    final isLocationEmpty = gameState.tile(destination) == null;
    final hasAdjacentTile = destination.hasAdjacentTile(gameState);
    final tilesAvailable = gameState.tilesAvailable;

    return isLocationEmpty &&
        hasAdjacentTile &&
        !gameState.hasWinner &&
        !tilesAvailable &&
        isSourceTileCorrect &&
        _actionDoesNotOrphan(gameState);
  }

  bool _actionDoesNotOrphan(GameState gameState) {
    final potentialGameState = applyAction(gameState);
    return hasNoOrphans(potentialGameState);
  }

  @override
  GameState applyAction(GameState gameState) {
    final tile = Tile(location: destination, color: playerColor);
    gameState = gameState.placeTile(tile);
    gameState = gameState.removeTile(source);

    return postMoveUpdate(gameState, tile);
  }
}
