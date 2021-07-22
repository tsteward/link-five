import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/network/serializers.dart';

part 'game_start.g.dart';

abstract class GameStart implements Built<GameStart, GameStartBuilder> {
  static Serializer<GameStart> get serializer => _$gameStartSerializer;

  BuiltList<String> get turnOrder;

  GameStart._();
  factory GameStart([void Function(GameStartBuilder) updates]) = _$GameStart;

  Map<String, dynamic>? toMap() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  String toJson() => jsonEncode(serializers.serializeWith(serializer, this));

  static GameStart? fromMap(Object object) =>
      serializers.deserializeWith(serializer, object);
  static GameStart? fromJson(String jsonString) =>
      serializers.deserializeWith(serializer, jsonDecode(jsonString));
}
