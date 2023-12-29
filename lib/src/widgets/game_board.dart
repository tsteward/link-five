import 'package:flutter/material.dart';
import 'package:link_five/src/logic/actions/move_tile_action.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/widgets/tile_location_helpers.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';
import 'package:link_five/src/widgets/game_board/tile_painter.dart';

class GameBoardWidget extends StatefulWidget {
  final GameState gameState;
  final PlayerColor playerColor;
  final Function(TileLocation location) onClick;
  final TileLocation? selectedLocation;
  final bool isScalable;

  const GameBoardWidget({
    super.key,
    required this.gameState,
    required this.playerColor,
    required this.onClick,
    required this.selectedLocation,
    required this.isScalable,
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
    if (isPlayerTurn &&
        _hoverLocation != null &&
        _checkValidSelection(_hoverLocation!)) {
      hoverLocation = _hoverLocation;
    }
    currentPlayerColor = widget.playerColor;
    return MouseRegion(
      onHover: (event) => setState(() => _hoverLocation = event.localPosition
          .toTileLocation(context, widget.isScalable, widget.gameState)),
      onExit: (_) => setState(() => _hoverLocation = null),
      cursor:
          hoverLocation == null ? MouseCursor.defer : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (details) {
          widget.onClick(details.localPosition
              .toTileLocation(context, widget.isScalable, widget.gameState));
        },
        child: CustomPaint(
          painter: TilePainter(
            gameState: widget.gameState,
            hoverLocation: hoverLocation,
            selectedLocation: widget.selectedLocation,
            currentPlayerColor: currentPlayerColor,
            isScalable: widget.isScalable,
          ),
          child: Container(),
        ),
      ),
    );
  }

  bool _checkValidSelection(TileLocation hoverLocation) {
    if (widget.gameState.tilesAvailable) {
      return PlaceTileAction(
        playerColor: widget.playerColor,
        location: hoverLocation,
      ).isPermitted(widget.gameState);
    } else if (widget.selectedLocation == null) {
      return widget.gameState.gameBoard[hoverLocation]?.color ==
          widget.playerColor;
    } else {
      return MoveTileAction(
              playerColor: widget.playerColor,
              source: widget.selectedLocation!,
              destination: hoverLocation)
          .isPermitted(widget.gameState);
    }
  }
}

extension TileLocationConversion on Offset {
  TileLocation toTileLocation(
      BuildContext context, bool isScalable, GameState gameState) {
    final size = MediaQuery.of(context).size;
    final center = size.center(Offset.zero);
    final relative = this - center;
    int x;
    int y;
    if (isScalable) {
      double scaledSize = gameState.calculateScaledSize(size);

      x = (relative.dx / scaledSize + gameState.xCenter).round();
      y = (relative.dy / scaledSize + gameState.yCenter).round();
    } else {
      x = (relative.dx / tileSize).round();
      y = (relative.dy / tileSize).round();
    }
    return TileLocation(x, y);
  }
}
