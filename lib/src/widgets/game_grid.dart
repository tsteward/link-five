import 'package:flutter/material.dart';

import 'game_board/grid_painter.dart';

class GameGridWidget extends StatelessWidget {
  const GameGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(),
      child: Container(),
    );
  }
}
