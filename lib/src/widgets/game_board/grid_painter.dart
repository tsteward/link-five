import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/widgets/constants.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';

class GridPainter extends CustomPainter {
  GridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    print("grid_painter");
    final center = size.center(Offset.zero);

    canvas.drawLine(
      Offset(200, 200),
      Offset(400, 400),
      Paint()..color = Colors.black,
    );
    print("Width: ${size.width} Height: ${size.height} tileSize: $tileSize");
    print("${size.width / tileSize / 2}");

    for (var i = 0; i < size.width / tileSize / 2; i++) {
      canvas.drawLine(
        Offset(
          tileSize * i + tileSize / 2,
          0,
        ),
        Offset(
          tileSize * i + tileSize / 2,
          size.height,
        ),
        Paint()..color = Colors.grey,
      );

      canvas.drawLine(
        Offset(
          (tileSize * i + tileSize / 2) * -1,
          0,
        ),
        Offset(
          (tileSize * i + tileSize / 2) * -1,
          size.height,
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
