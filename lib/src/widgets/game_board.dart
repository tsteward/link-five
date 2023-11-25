import 'package:flutter/material.dart';
import 'package:link_five/src/logic/actions/move_tile_action.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
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
    if (isPlayerTurn &&
        _hoverLocation != null &&
        _checkValidSelection(_hoverLocation!)) {
      hoverLocation = _hoverLocation;
    }
    currentPlayerColor = widget.playerColor;
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
  TileLocation toTileLocation(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final center = size.center(Offset.zero);
    final relative = this - center;
    final x = (relative.dx / tileSize).round();
    final y = (relative.dy / tileSize).round();
    return TileLocation(x, y);
  }
}
