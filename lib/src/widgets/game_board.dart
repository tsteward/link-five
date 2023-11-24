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
  final TileLocation? selectedLocation;

  const GameBoardWidget({
    super.key,
    required this.gameState,
    required this.playerColor,
    required this.onClick,
    required this.selectedLocation,
  });

  @override
  GameBoardWidgetState createState() => GameBoardWidgetState();
}

class GameBoardWidgetState extends State<GameBoardWidget> {
  TileLocation? _hoverLocation;

  @override
  Widget build(BuildContext context) {
    PlayerColor? currentPlayerColor;
    TileLocation? hoverLocation;
    final isPlayerTurn = widget.playerColor == widget.gameState.currentPlayer;
    final hoverIsUnoccupied =
        widget.gameState.gameBoard[_hoverLocation] == null;
    currentPlayerColor = widget.playerColor;
    if (isPlayerTurn && hoverIsUnoccupied) {
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
            selectedLocation: widget.selectedLocation,
            currentPlayerColor: currentPlayerColor,
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
