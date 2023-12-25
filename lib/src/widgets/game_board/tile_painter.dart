import 'dart:math';

import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/widgets/constants.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';

class TilePainter extends CustomPainter {
  final GameState gameState;
  final TileLocation? hoverLocation;
  final TileLocation? selectedLocation;
  final PlayerColor? currentPlayerColor;
  final bool isScalable;

  TilePainter({
    required this.gameState,
    required this.hoverLocation,
    required this.selectedLocation,
    required this.currentPlayerColor,
    required this.isScalable,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double scaledSize = tileSize;
    if (isScalable) {
      scaledSize = min(size.width / (gameState.xRange + margin),
          size.height / (gameState.yRange + margin));
    }
    for (final tile in gameState.tiles) {
      final tileCenter = tile.location.toOffset(size, isScalable, gameState);
      canvas.drawTile(
        center: tileCenter,
        color: playerColorToFlutterColor[tile.color]!,
        strokeColor: Colors.black,
        tileSize: scaledSize,
      );
    }

    if (gameState.winningTiles != null) {
      for (final tile in gameState.winningTiles!) {
        final tileCenter = tile.location.toOffset(size, isScalable, gameState);
        canvas.drawTile(
          center: tileCenter,
          strokeColor: Colors.red,
          tileSize: scaledSize,
        );
      }
    }

    if (hoverLocation != null &&
        currentPlayerColor != null &&
        selectedLocation != hoverLocation) {
      final tileCenter = hoverLocation!.toOffset(size, isScalable, gameState);
      canvas.drawTile(
          center: tileCenter,
          color: playerColorToFlutterColor[currentPlayerColor]!.shade100,
          strokeColor: Colors.grey,
          tileSize: scaledSize,
          );
    }

    if (selectedLocation != null && currentPlayerColor != null) {
      final tileCenter =
          selectedLocation!.toOffset(size, isScalable, gameState);
      canvas.drawTile(
          center: tileCenter,
          color: playerColorToFlutterColor[currentPlayerColor]!.shade100,
          strokeColor: Colors.blue,
          tileSize: scaledSize,
          );
    }
  }

  @override
  bool shouldRepaint(TilePainter oldDelegate) {
    return oldDelegate.gameState != gameState ||
        oldDelegate.hoverLocation != hoverLocation ||
        oldDelegate.currentPlayerColor != currentPlayerColor ||
        oldDelegate.selectedLocation != selectedLocation;
  }
}

extension OffsetConversion on TileLocation {
  Offset toOffset(Size size, bool isScalable, GameState gameState) {
    final center = size.center(Offset.zero);
    if (isScalable) {
      final scalableTileSize = min(size.width / (gameState.xRange + margin),
          size.height / (gameState.yRange + margin));
      return Offset(
        center.dx + (x - gameState.xCenter) * scalableTileSize,
        center.dy + (y - gameState.yCenter) * scalableTileSize,
      );
    } else {
      return Offset(
        center.dx + x * tileSize,
        center.dy + y * tileSize,
      );
    }
  }
}

extension TileDrawer on Canvas {
  void drawTile({
    required Offset center,
    Color? color,
    Color? strokeColor,
    required double tileSize,
  }) {
    if (color != null) {
      drawRect(
        Rect.fromCenter(
          center: center,
          width: tileSize,
          height: tileSize,
        ),
        Paint()..color = color,
      );
    }

    if (strokeColor != null) {
      drawRect(
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
