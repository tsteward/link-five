import 'package:built_collection/built_collection.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

extension AdjacencyChecking on TileLocation {
  bool hasAdjacentTile(GameState gameState, [TileLocation? location]) =>
      _isOccupied(gameState, location, _Direction(1, 0)) ||
      _isOccupied(gameState, location, _Direction(-1, 0)) ||
      _isOccupied(gameState, location, _Direction(0, 1)) ||
      _isOccupied(gameState, location, _Direction(0, -1));

  bool _isOccupied(
      GameState gameState, TileLocation? location, _Direction dir) {
    if (location == null) {
      return _getRelativeTile(gameState, this, dir, 1) != null;
    } else {
      return _getRelativeTile(gameState, this, dir, 1) != null &&
          _getRelativeLocation(location, dir, 1) != location;
    }
  }
}

bool hasNoOrphans(GameState gameState) {
  Set<TileLocation> set = Set();
  final first = gameState.gameBoard.entries.first;
  _hasNoOrphansRecursive(gameState, set, first.key);
  return set.length == gameState.gameBoard.length;
}

void _hasNoOrphansRecursive(
    GameState gameState, Set<TileLocation> set, TileLocation location) {
  if (!set.contains(location)) {
    set.add(location);
    _checkDirection(gameState, location, _Direction(1, 0), set);
    _checkDirection(gameState, location, _Direction(-1, 0), set);
    _checkDirection(gameState, location, _Direction(0, 1), set);
    _checkDirection(gameState, location, _Direction(0, -1), set);
  }
}

void _checkDirection(GameState gameState, TileLocation location, _Direction dir,
    Set<TileLocation> set) {
  if (_getRelativeTile(gameState, location, dir, 1) != null) {
    _hasNoOrphansRecursive(
        gameState, set, _getRelativeLocation(location, dir, 1));
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
  final tileLocation = _getRelativeLocation(location, direction, distance);
  final tile = gameState.tile(tileLocation);
  return tile;
}

TileLocation _getRelativeLocation(
    TileLocation location, _Direction direction, int distance) {
  final tileX = location.x + direction.x * distance;
  final tileY = location.y + direction.y * distance;
  final tileLocation = TileLocation(tileX, tileY);
  return tileLocation;
}

class _Direction {
  final int x;
  final int y;
  const _Direction(this.x, this.y);
}
