import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/serializers.dart';

part 'player.g.dart';

abstract class Player implements Built<Player, PlayerBuilder> {
  static Serializer<Player> get serializer => _$playerSerializer;

  String get name;
  PlayerColor get color;
  bool get isReady;

  Player._();
  factory Player([void Function(PlayerBuilder) updates]) = _$Player;

  Map<String, dynamic>? toMap() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  String toJson() => jsonEncode(serializers.serializeWith(serializer, this));

  static Player? fromMap(Object object) =>
      serializers.deserializeWith(serializer, object);
  static Player? fromJson(String jsonString) =>
      serializers.deserializeWith(serializer, jsonDecode(jsonString));
}
