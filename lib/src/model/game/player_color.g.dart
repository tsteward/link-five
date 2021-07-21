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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
