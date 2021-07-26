import 'package:flutter/material.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';

class GridPainter extends CustomPainter {
  GridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    for (var i = 0; i < size.width / tileSize / 2; i++) {
      canvas.drawLine(
        Offset(
          tileSize * i + tileSize / 2 + center.dx,
          0,
        ),
        Offset(
          tileSize * i + tileSize / 2 + center.dx,
          size.height,
        ),
        Paint()..color = Colors.grey,
      );

      canvas.drawLine(
        Offset(
          (tileSize * i + tileSize / 2) * -1 + center.dx,
          0,
        ),
        Offset(
          (tileSize * i + tileSize / 2) * -1 + center.dx,
          size.height,
        ),
        Paint()..color = Colors.grey,
      );
    }
    for (var i = 0; i < size.height / tileSize / 2; i++) {
      canvas.drawLine(
        Offset(
          0,
          tileSize * i + tileSize / 2 + center.dy,
        ),
        Offset(
          size.width,
          tileSize * i + tileSize / 2 + center.dy,
        ),
        Paint()..color = Colors.grey,
      );

      canvas.drawLine(
        Offset(
          0,
          (tileSize * i + tileSize / 2) * -1 + center.dy,
        ),
        Offset(
          size.width,
          (tileSize * i + tileSize / 2) * -1 + center.dy,
        ),
        Paint()..color = Colors.grey,
      );
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) {
    return false;
  }
}
