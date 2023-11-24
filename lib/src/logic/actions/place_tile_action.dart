import 'package:link_five/src/logic/actions/action_helpers.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

class PlaceTileAction extends GameAction {
  TileLocation location;

  PlaceTileAction({
    required PlayerColor playerColor,
    required this.location,
  }) : super(playerColor: playerColor);

  @override
  bool isPermitted(GameState gameState) {
    final isGameBoardEmpty = gameState.tiles.isEmpty;
    final isLocationEmpty = gameState.tile(location) == null;
    final hasAdjacentTile = location.hasAdjacentTile(gameState);
    final tilesAvailable = gameState.tilesAvailable;

    return isLocationEmpty &&
        (hasAdjacentTile || isGameBoardEmpty) &&
        !gameState.hasWinner &&
        tilesAvailable;
  }

  @override
  GameState applyAction(GameState gameState) {
    final tile = Tile(location: location, color: playerColor);
    gameState = gameState.placeTile(tile);

    return rebuildGameState(gameState, tile);
  }
}
