import 'package:built_collection/built_collection.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

extension AdjacencyChecking on TileLocation {
  bool hasAdjacentTile(GameState gameState, [TileLocation? location]) =>
      isOccupied(gameState, location, _Direction(1, 0)) ||
      isOccupied(gameState, location, _Direction(-1, 0)) ||
      isOccupied(gameState, location, _Direction(0, 1)) ||
      isOccupied(gameState, location, _Direction(0, -1));

  bool isOccupied(GameState gameState, TileLocation? location, _Direction dir) {
    return _getRelativeTile(gameState, this, dir, 1) != null &&
        _getRelativeTile(gameState, this, dir, 1)?.location != location;
  }
}

BuiltSet<Tile>? findWin(GameState gameState, Tile startingTile) {
  final directions = const [
    _Direction(1, 0),
    _Direction(1, 1),
    _Direction(0, 1),
    _Direction(-1, 1),
  ];
  for (final direction in directions) {
    final winningTiles = <Tile>{startingTile};

    // check tiles after
    bool endFound = false;
    for (var i = 1; i < 5 && !endFound; i++) {
      final tile =
          _getRelativeTile(gameState, startingTile.location, direction, i);
      if (startingTile.color == tile?.color) {
        winningTiles.add(tile!);
      } else {
        endFound = true;
      }
    }

    // check tiles before
    endFound = false;
    for (var i = -1; i > -5 && !endFound; i--) {
      final tile =
          _getRelativeTile(gameState, startingTile.location, direction, i);
      if (startingTile.color == tile?.color) {
        winningTiles.add(tile!);
      } else {
        endFound = true;
      }
    }

    if (winningTiles.length >= 5) {
      return winningTiles.toBuiltSet();
    }
  }
  return null;
}

Tile? _getRelativeTile(GameState gameState, TileLocation location,
    _Direction direction, int distance) {
  final tileX = location.x + direction.x * distance;
  final tileY = location.y + direction.y * distance;
  final tile = gameState.tile(TileLocation(tileX, tileY));
  return tile;
}

class _Direction {
  final int x;
  final int y;
  const _Direction(this.x, this.y);
}
