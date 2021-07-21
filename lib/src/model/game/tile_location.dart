import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tile_location.g.dart';

abstract class TileLocation
    implements Built<TileLocation, TileLocationBuilder> {
  static Serializer<TileLocation> get serializer => _$tileLocationSerializer;

  int get x;
  int get y;

  TileLocation._();
  factory TileLocation(int x, int y) => _$TileLocation(
        (b) => b
          ..x = x
          ..y = y,
      );
}
