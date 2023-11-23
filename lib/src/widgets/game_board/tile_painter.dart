import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/widgets/constants.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';

class TilePainter extends CustomPainter {
  final GameState gameState;
  final TileLocation? hoverLocation;
  final PlayerColor? hoverColor;

  TilePainter({
    required this.gameState,
    required this.hoverLocation,
    required this.hoverColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final tile in gameState.tiles) {
      final tileCenter = tile.location.toOffset(size);
      canvas.drawTile(
        center: tileCenter,
        color: playerColorToFlutterColor[tile.color]!,
        strokeColor: Colors.black,
      );
    }

    if (gameState.winningTiles != null) {
      for (final tile in gameState.winningTiles!) {
        final tileCenter = tile.location.toOffset(size);
        canvas.drawTile(
          center: tileCenter,
          strokeColor: Colors.red,
        );
      }
    }

    if (hoverLocation != null && hoverColor != null) {
      final tileCenter = hoverLocation!.toOffset(size);
      canvas.drawTile(
          center: tileCenter,
          color: playerColorToFlutterColor[hoverColor]!.shade100,
          strokeColor: Colors.grey);
    }
  }

  @override
  bool shouldRepaint(TilePainter oldDelegate) {
    return oldDelegate.gameState != gameState ||
        oldDelegate.hoverLocation != hoverLocation ||
        oldDelegate.hoverColor != hoverColor;
  }
}

extension OffsetConversion on TileLocation {
  Offset toOffset(Size size) {
    final center = size.center(Offset.zero);
    return Offset(
      center.dx + this.x * tileSize,
      center.dy + this.y * tileSize,
    );
  }
}

extension TileDrawer on Canvas {
  void drawTile({
    required Offset center,
    Color? color,
    Color? strokeColor,
  }) {
    if (color != null) {
      this.drawRect(
        Rect.fromCenter(
          center: center,
          width: tileSize,
          height: tileSize,
        ),
        Paint()..color = color,
      );
    }

    if (strokeColor != null) {
      this.drawRect(
        Rect.fromCenter(
          center: center,
          width: tileSize,
          height: tileSize,
        ),
        Paint()
          ..color = strokeColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
    }
  }
}
