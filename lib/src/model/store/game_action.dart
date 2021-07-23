import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/model/network/serializers.dart';

part 'game_action.g.dart';

abstract class GameAction implements Built<GameAction, GameActionBuilder> {
  static Serializer<GameAction> get serializer => _$gameActionSerializer;

  String get basedOn;
  String get userId;
  GameActionType get type;
  PlaceTileAction? get placeTileAction;

  GameAction._();
  factory GameAction([void Function(GameActionBuilder) updates]) = _$GameAction;

  Map<String, dynamic>? toMap() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  String toJson() => jsonEncode(serializers.serializeWith(serializer, this));

  static GameAction? fromMap(Object object) =>
      serializers.deserializeWith(serializer, object);
  static GameAction? fromJson(String jsonString) =>
      serializers.deserializeWith(serializer, jsonDecode(jsonString));
}

class GameActionType extends EnumClass {
  static Serializer<GameActionType> get serializer =>
      _$gameActionTypeSerializer;

  static const GameActionType placeTileAction = _$placeTileAction;

  const GameActionType._(String name) : super(name);

  static BuiltSet<GameActionType> get values => _$stValues;
  static GameActionType valueOf(String name) => _$stValueOf(name);
}

abstract class PlaceTileAction
    implements Built<PlaceTileAction, PlaceTileActionBuilder> {
  static Serializer<PlaceTileAction> get serializer =>
      _$placeTileActionSerializer;

  TileLocation get location;

  PlaceTileAction._();
  factory PlaceTileAction([void Function(PlaceTileActionBuilder) updates]) =
      _$PlaceTileAction;

  Map<String, dynamic>? toMap() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  String toJson() => jsonEncode(serializers.serializeWith(serializer, this));

  static PlaceTileAction? fromMap(Object object) =>
      serializers.deserializeWith(serializer, object);
  static PlaceTileAction? fromJson(String jsonString) =>
      serializers.deserializeWith(serializer, jsonDecode(jsonString));
}
