import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'player_color.g.dart';

class PlayerColor extends EnumClass {
  static Serializer<PlayerColor> get serializer => _$playerColorSerializer;

  static const PlayerColor green = _$green;
  static const PlayerColor orange = _$orange;
  static const PlayerColor pink = _$pink;
  static const PlayerColor yellow = _$yellow;

  const PlayerColor._(super.name);

  static BuiltSet<PlayerColor> get values => _$stValues;
  static PlayerColor valueOf(String name) => _$stValueOf(name);
}
