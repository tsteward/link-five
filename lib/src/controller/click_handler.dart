import 'package:link_five/src/logic/actions/move_tile_action.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';

class ClickHandler {
  TileLocation? source;
  GameAction? handleGameClick(
      GameState state, TileLocation location, PlayerColor playerColor) {
    if (state.tilesAvailable) {
      return PlaceTileAction(
        playerColor: playerColor,
        location: location,
      );
    } else {
      final colorAtLocation = state.gameBoard[location]?.color;
      print(colorAtLocation);
      if (source == null) {
        if (colorAtLocation != null && colorAtLocation == playerColor) {
          print(location);
          source = location;
        }
        return null;
      } else {
        if (colorAtLocation != null && colorAtLocation == playerColor) {
          if (location == source) {
            source = null;
          } else {
            source = location;
          }
          return null;
        } else if (colorAtLocation == null) {
          return (MoveTileAction(
              playerColor: playerColor,
              source: source!,
              destination: location));
        } else {
          return null;
        }
      }
    }
  }
}
