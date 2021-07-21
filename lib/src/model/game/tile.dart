import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';

part 'tile.g.dart';

abstract class Tile implements Built<Tile, TileBuilder> {
  static Serializer<Tile> get serializer => _$tileSerializer;

  TileLocation get location;
  PlayerColor get color;

  Tile._();
  factory Tile({required TileLocation location, required PlayerColor color}) =>
      _$Tile(
        (b) => b
          ..location = location.toBuilder()
          ..color = color,
      );
}
