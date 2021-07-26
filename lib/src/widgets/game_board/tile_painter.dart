import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/widgets/constants.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';

class TilePainter extends CustomPainter {
  GameState _gameState;

  TilePainter(this._gameState);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    for (final tile in _gameState.tiles) {
      final location = tile.location;
      final tileCenter = Offset(
        center.dx + location.x * tileSize,
        center.dy + location.y * tileSize,
      );

      canvas.drawRect(
        Rect.fromCenter(
          center: tileCenter,
          width: tileSize,
          height: tileSize,
        ),
        Paint()..color = playerColorToFlutterColor[tile.color]!,
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

    if (_gameState.winningTiles != null) {
      for (final tile in _gameState.winningTiles!) {
        final location = tile.location;
        final tileCenter = Offset(
          center.dx + location.x * tileSize,
          center.dy + location.y * tileSize,
        );
        canvas.drawRect(
          Rect.fromCenter(
            center: tileCenter,
            width: tileSize,
            height: tileSize,
          ),
          Paint()
            ..color = Colors.red
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3,
        );
      }
    }
  }

  @override
  bool shouldRepaint(TilePainter oldDelegate) {
    return oldDelegate._gameState != _gameState;
  }
}
