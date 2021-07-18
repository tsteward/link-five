import 'package:link_five/src/game_logic/game_board.dart';
import 'package:link_five/src/game_logic/player_color.dart';

class Game {
  final _gameBoard = GameBoard();
  final List<PlayerColor> _turnOrder;

  var _turnIndex = 0;
  List<Tile>? winningTiles;

  bool get hasWinner => winningTiles != null;

  Game({required List<PlayerColor> turnOrder}) : _turnOrder = turnOrder;

  List<Tile> get tiles => _gameBoard.tiles;
  PlayerColor get currentPlayer => _turnOrder[_turnIndex];

  ActionStatus applyAction(GameAction action) {
    if (action.playerColor != currentPlayer) {
      return ActionStatus.fail;
    }
    if (!_isActionPermitted(action)) {
      return ActionStatus.fail;
    }

    if (action is PlaceTileAction) {
      _gameBoard.placeTile(action.x, action.y, action.playerColor);
      winningTiles = _findWin(action.x, action.y, action.playerColor);
      if (!hasWinner) {
        _nextTurn();
      }
    }

    return ActionStatus.fail;
  }

  void _nextTurn() => _turnIndex = (_turnIndex + 1) % _turnOrder.length;

  bool _isActionPermitted(GameAction action) {
    if (action is PlaceTileAction) {
      final isGameBoardEmpty = _gameBoard.tiles.isEmpty;
      final isTileEmpty = _gameBoard.tile(action.x, action.y) == null;
      final isTileNextToTile =
          _gameBoard.tile(action.x + 1, action.y) != null ||
              _gameBoard.tile(action.x - 1, action.y) != null ||
              _gameBoard.tile(action.x, action.y + 1) != null ||
              _gameBoard.tile(action.x, action.y - 1) != null;
      return isTileEmpty &&
          (isTileNextToTile || isGameBoardEmpty) &&
          !hasWinner;
    }

    return false;
  }

  List<Tile>? _findWin(int x, int y, PlayerColor color) {
    final directions = const [
      _Direction(1, 0),
      _Direction(1, 1),
      _Direction(0, 1),
      _Direction(-1, 1),
      _Direction(-1, 0),
      _Direction(-1, -1),
      _Direction(0, -1),
      _Direction(1, -1),
    ];
    for (final direction in directions) {
      final winningTiles = <Tile>[];
      bool isNotWin = false;
      for (var i = 0; i < 5 && !isNotWin; i++) {
        final tileX = x + direction.x * i;
        final tileY = y + direction.y * i;
        final tile = _gameBoard.tile(tileX, tileY);
        if (tile != color) {
          isNotWin = true;
        }
        winningTiles.add(Tile(tileX, tileY, color));
      }
      if (!isNotWin) {
        return winningTiles;
      }
    }
    return null;
  }
}

abstract class GameAction {
  final PlayerColor playerColor;
  GameAction({required this.playerColor});
}

class PlaceTileAction extends GameAction {
  int x;
  int y;

  PlaceTileAction({
    required PlayerColor playerColor,
    required this.x,
    required this.y,
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
