import 'package:link_five/src/logic/actions/action_helpers.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

class MoveTileAction extends GameAction {
  TileLocation _source;
  TileLocation _destination;
  TileLocation get source => _source;
  TileLocation get destination => _destination;

  MoveTileAction({
    required PlayerColor playerColor,
    required TileLocation source,
    required TileLocation destination,
  })  : _destination = destination,
        _source = source,
        super(playerColor: playerColor);

  @override
  bool isPermitted(GameState gameState) {
    final isSourceTileCorrect = gameState.tile(_source)?.color == playerColor;
    final isLocationEmpty = gameState.tile(_destination) == null;
    final hasAdjacentTile = _destination.hasAdjacentTile(gameState);
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
    final tile = Tile(location: _destination, color: playerColor);
    gameState = gameState.placeTile(tile);
    gameState = gameState.removeTile(_source);

    return postMoveUpdate(gameState, tile);
  }
}
