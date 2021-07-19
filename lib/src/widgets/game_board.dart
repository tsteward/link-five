import 'package:flutter/material.dart';
import 'package:link_five/src/model/game_state.dart';
import 'package:link_five/src/model/tile_location.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';
import 'package:link_five/src/widgets/game_board/tile_painter.dart';

class GameBoardWidget extends StatelessWidget {
  final GameState gameState;
  final Function(TileLocation location) onClick;

  const GameBoardWidget(
      {Key? key, required this.gameState, required this.onClick})
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
        onClick(TileLocation(x, y));
      },
      child: CustomPaint(
        painter: TilePainter(gameState),
        child: Container(),
      ),
    );
  }
}
