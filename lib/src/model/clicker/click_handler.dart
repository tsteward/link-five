import 'dart:async';

import 'package:link_five/src/logic/actions/move_tile_action.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';

class ClickHandler {
  TileLocation? _selectedLocation;
  TileLocation? get selectedLocation => _selectedLocation;
  var _stateStreamController = StreamController<TileLocation?>.broadcast();
  Stream<TileLocation?> get stateStream => _stateStreamController.stream;

  GameAction? handleGameClick(
    GameState state,
    TileLocation location,
    PlayerColor playerColor,
  ) {
    if (state.tilesAvailable) {
      return PlaceTileAction(
        playerColor: playerColor,
        location: location,
      );
    } else {
      return _handleMoveTileSelector(state, location, playerColor);
    }
  }

  MoveTileAction? _handleMoveTileSelector(
      GameState state, TileLocation location, PlayerColor playerColor) {
    final colorAtLocation = state.gameBoard[location]?.color;
    if (colorAtLocation == null && _selectedLocation != null) {
      final action = MoveTileAction(
        playerColor: playerColor,
        source: _selectedLocation!,
        destination: location,
      );
      _setSource(null);
      return action;
    } else if (location == _selectedLocation) {
      _setSource(null);
    } else if (colorAtLocation == playerColor) {
      _setSource(location);
    }
    return null;
  }

  void _setSource(TileLocation? newState) {
    _selectedLocation = newState;
    _stateStreamController.add(newState);
  }
}
