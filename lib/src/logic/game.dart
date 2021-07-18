import 'package:built_collection/built_collection.dart';
import 'package:link_five/src/model/game_state.dart';
import 'package:link_five/src/model/player_color.dart';
import 'package:link_five/src/model/tile.dart';
import 'package:link_five/src/model/tile_location.dart';

class Game {
  GameState _gameState;
  GameState get gameState => _gameState;

  Game({required List<PlayerColor> turnOrder})
      : _gameState = GameState(turnOrder.toBuiltList());

  ActionStatus applyAction(GameAction action) {
    if (action.playerColor != _gameState.currentPlayer) {
      return ActionStatus.fail;
    }
    if (!_isActionPermitted(action)) {
      return ActionStatus.fail;
    }

    if (action is PlaceTileAction) {
      final tile = Tile(location: action.location, color: action.playerColor);
      _gameState = _gameState.placeTile(tile);

      final winningTiles = _findWin(gameState, tile);
      if (winningTiles == null) {
        _gameState = _gameState.rebuild(
          (b) => b..turnIndex = _nextTurn(_gameState),
        );
      } else {
        _gameState = _gameState.rebuild(
          (b) => b..winningTiles = winningTiles.toBuilder(),
        );
      }
    }

    return ActionStatus.fail;
  }

  int _nextTurn(GameState gameState) =>
      (gameState.turnIndex + 1) % gameState.turnOrder.length;

  bool _isActionPermitted(GameAction action) {
    if (action is PlaceTileAction) {
      final isGameBoardEmpty = _gameState.tiles.isEmpty;
      final isTileEmpty = _gameState.tile(action.location) == null;
      final isTileNextToTile = _getRelativeTile(
                  _gameState, action.location, _Direction(1, 0), 1) !=
              null ||
          _getRelativeTile(_gameState, action.location, _Direction(-1, 0), 1) !=
              null ||
          _getRelativeTile(_gameState, action.location, _Direction(0, 1), 1) !=
              null ||
          _getRelativeTile(_gameState, action.location, _Direction(0, -1), 1) !=
              null;
      return isTileEmpty &&
          (isTileNextToTile || isGameBoardEmpty) &&
          !_gameState.hasWinner;
    }

    return false;
  }

  BuiltSet<Tile>? _findWin(GameState gameState, Tile startingTile) {
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
}

abstract class GameAction {
  final PlayerColor playerColor;
  GameAction({required this.playerColor});
}

class PlaceTileAction extends GameAction {
  TileLocation location;

  PlaceTileAction({
    required PlayerColor playerColor,
    required this.location,
  }) : super(playerColor: playerColor);
}

enum ActionStatus {
  success,
  fail,
}

class _Direction {
  final int x;
  final int y;
  const _Direction(this.x, this.y);
}
