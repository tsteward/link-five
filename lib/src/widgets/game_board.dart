import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';
import 'package:link_five/src/widgets/game_board/tile_painter.dart';

class GameBoardWidget extends StatefulWidget {
  final GameState gameState;
  final PlayerColor playerColor;
  final Function(TileLocation location) onClick;

  const GameBoardWidget({
    Key? key,
    required this.gameState,
    required this.playerColor,
    required this.onClick,
  }) : super(key: key);

  @override
  _GameBoardWidgetState createState() => _GameBoardWidgetState();
}

class _GameBoardWidgetState extends State<GameBoardWidget> {
  TileLocation? _hoverLocation;

  @override
  Widget build(BuildContext context) {
    PlayerColor? hoverColor;
    TileLocation? hoverLocation;
    final isPlayerTurn = widget.playerColor == widget.gameState.currentPlayer;
    final hoverIsUnoccupied =
        widget.gameState.gameBoard[_hoverLocation] == null;
    if (isPlayerTurn && hoverIsUnoccupied) {
      hoverColor = widget.playerColor;
      hoverLocation = _hoverLocation;
    }

    return MouseRegion(
      onHover: (event) => setState(
          () => _hoverLocation = event.localPosition.toTileLocation(context)),
      onExit: (_) => setState(() => _hoverLocation = null),
      cursor:
          hoverLocation == null ? MouseCursor.defer : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (details) {
          widget.onClick(details.localPosition.toTileLocation(context));
        },
        child: CustomPaint(
          painter: TilePainter(
            gameState: widget.gameState,
            hoverLocation: hoverLocation,
            hoverColor: hoverColor,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

extension TileLocationConversion on Offset {
  TileLocation toTileLocation(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final center = size.center(Offset.zero);
    final relative = this - center;
    final x = (relative.dx / tileSize).round();
    final y = (relative.dy / tileSize).round();
    return TileLocation(x, y);
  }
}
