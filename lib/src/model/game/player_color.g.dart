// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_color.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PlayerColor _$green = const PlayerColor._('green');
const PlayerColor _$orange = const PlayerColor._('orange');
const PlayerColor _$pink = const PlayerColor._('pink');
const PlayerColor _$yellow = const PlayerColor._('yellow');

PlayerColor _$stValueOf(String name) {
  switch (name) {
    case 'green':
      return _$green;
    case 'orange':
      return _$orange;
    case 'pink':
      return _$pink;
    case 'yellow':
      return _$yellow;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PlayerColor> _$stValues =
    new BuiltSet<PlayerColor>(const <PlayerColor>[
  _$green,
  _$orange,
  _$pink,
  _$yellow,
]);

Serializer<PlayerColor> _$playerColorSerializer = new _$PlayerColorSerializer();

class _$PlayerColorSerializer implements PrimitiveSerializer<PlayerColor> {
  @override
  final Iterable<Type> types = const <Type>[PlayerColor];
  @override
  final String wireName = 'PlayerColor';

  @override
  Object serialize(Serializers serializers, PlayerColor object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PlayerColor deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PlayerColor.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
