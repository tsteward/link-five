import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

part 'game_state.g.dart';

abstract class GameState implements Built<GameState, GameStateBuilder> {
  static const tilesAvailablePerPlayer = 15;
  static Serializer<GameState> get serializer => _$gameStateSerializer;

  BuiltMap<TileLocation, Tile> get gameBoard;
  BuiltList<PlayerColor> get turnOrder;
  int get turnNumber;
  int get turnIndex => turnNumber % turnOrder.length;

  BuiltSet<Tile>? get winningTiles;

  PlayerColor get currentPlayer => turnOrder[turnIndex];
  bool get hasWinner => winningTiles != null;

  @memoized
  BuiltList<Tile> get tiles => gameBoard.values.toBuiltList();

  @memoized
  bool get tilesAvailable {
    return turnNumber < tilesAvailablePerPlayer * turnOrder.length;
  }

  @memoized
  int get xMax {
    int max = gameBoard.keys.first.x;
    for (var location in gameBoard.keys) {
      if (location.x > max) {
        max = location.x;
      }
    }
    return max;
  }

  @memoized
  int get yMax {
    int max = gameBoard.keys.first.y;
    for (var location in gameBoard.keys) {
      if (location.y > max) {
        max = location.y;
      }
    }
    return max;
  }

  @memoized
  int get xMin {
    int min = gameBoard.keys.first.x;
    for (var location in gameBoard.keys) {
      if (location.x < min) {
        min = location.x;
      }
    }
    return min;
  }

  @memoized
  int get yMin {
    int min = gameBoard.keys.first.y;
    for (var location in gameBoard.keys) {
      if (location.y < min) {
        min = location.y;
      }
    }
    return min;
  }

  @memoized
  double get xCenter {
    return (xMax + xMin) / 2.0;
  }

  @memoized
  double get yCenter {
    return (yMax + yMin) / 2.0;
  }

  @memoized
  int get xRange {
    return xMax - xMin;
  }

  @memoized
  int get yRange {
    return yMax - yMin;
  }

  Tile? tile(TileLocation location) => gameBoard[location];

  GameState placeTile(Tile tile) =>
      rebuild((b) => b.gameBoard[tile.location] = tile);

  GameState removeTile(TileLocation location) =>
      rebuild((b) => b.gameBoard.remove(location));

  GameState._();
  factory GameState([BuiltList<PlayerColor>? turnOrder]) => _$GameState(
        (b) => b
          ..turnOrder = (turnOrder?.toBuilder() ?? ListBuilder<PlayerColor>())
          ..turnNumber = 0,
      );
}
