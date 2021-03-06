import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile.dart';
import 'package:link_five/src/model/game/tile_location.dart';

part 'game_state.g.dart';

abstract class GameState implements Built<GameState, GameStateBuilder> {
  static Serializer<GameState> get serializer => _$gameStateSerializer;

  BuiltMap<TileLocation, Tile> get gameBoard;
  BuiltList<PlayerColor> get turnOrder;
  int get turnIndex;

  BuiltSet<Tile>? get winningTiles;

  PlayerColor get currentPlayer => turnOrder[turnIndex];
  bool get hasWinner => winningTiles != null;

  @memoized
  BuiltList<Tile> get tiles => gameBoard.values.toBuiltList();

  Tile? tile(TileLocation location) => gameBoard[location];

  GameState placeTile(Tile tile) =>
      this.rebuild((b) => b.gameBoard[tile.location] = tile);

  GameState._();
  factory GameState([BuiltList<PlayerColor>? turnOrder]) => _$GameState(
        (b) => b
          ..turnOrder = (turnOrder?.toBuilder() ?? ListBuilder<PlayerColor>())
          ..turnIndex = 0,
      );
}
