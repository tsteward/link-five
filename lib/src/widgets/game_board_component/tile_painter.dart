import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_five/src/game_logic/game_board.dart';
import 'package:link_five/src/game_logic/player_color.dart';
import 'package:link_five/src/widgets/game_board_component/constants.dart';

class TilePainter extends CustomPainter {
  List<Tile> _tiles;
  List<Tile>? _winningTiles;

  TilePainter(this._tiles, this._winningTiles);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    for (final tile in _tiles) {
      final tileCenter = Offset(
        center.dx + tile.x * tileSize,
        center.dy + tile.y * tileSize,
      );

      canvas.drawRect(
        Rect.fromCenter(
          center: tileCenter,
          width: tileSize,
          height: tileSize,
        ),
        Paint()..color = _tileColorToFlutterColor(tile.value),
      );
      canvas.drawRect(
        Rect.fromCenter(
          center: tileCenter,
          width: tileSize,
          height: tileSize,
        ),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
    }

    if (_winningTiles != null) {
      for (final tile in _winningTiles!) {
      final tileCenter = Offset(
        center.dx + tile.x * tileSize,
        center.dy + tile.y * tileSize,
      );
        canvas.drawRect(
        Rect.fromCenter(
          center: tileCenter,
          width: tileSize,
          height: tileSize,
        ),
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
      }
    }
  }

  Color _tileColorToFlutterColor(PlayerColor tileColor) {
    switch (tileColor) {
      case PlayerColor.green:
        return Colors.green;
      case PlayerColor.orangle:
        return Colors.orange;
      case PlayerColor.pink:
        return Colors.pink;
      case PlayerColor.yellow:
        return Colors.yellow;
    }
  }

  @override
  bool shouldRepaint(TilePainter oldDelegate) {
    return oldDelegate._tiles != _tiles || oldDelegate._winningTiles != _winningTiles;
  }
}
