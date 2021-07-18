import 'package:flutter/material.dart';
import 'package:link_five/src/game_logic/game_board.dart';
import 'package:link_five/src/widgets/game_board_component/constants.dart';
import 'package:link_five/src/widgets/game_board_component/tile_painter.dart';

class GameBoardComponent extends StatelessWidget {
  final List<Tile> tiles;
  final Function(int x, int y) onClick;

  const GameBoardComponent(
      {Key? key, required this.tiles, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        final size = MediaQuery.of(context).size;
        final center = size.center(Offset.zero);
        final relative = details.globalPosition - center;
        final x = (relative.dx / tileSize).round();
        final y = (relative.dy / tileSize).round();
        onClick(x, y);
      },
      child: CustomPaint(
        painter: TilePainter(tiles),
        child: Container(),
      ),
    );
  }
}
