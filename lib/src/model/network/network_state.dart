import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/model/network/serializers.dart';

part 'network_state.g.dart';

abstract class NetworkState
    implements Built<NetworkState, NetworkStateBuilder> {
  static Serializer<NetworkState> get serializer => _$networkStateSerializer;

  String? get userId;
  String? get gameCode;
  BuiltMap<String, Player>? get players;
  BuiltList<String>? get turnOrderByUserId;

  @memoized
  BuiltList<PlayerColor>? get turnOrderByColor {
    if (players == null || turnOrderByUserId == null) {
      return null;
    }
    final list = ListBuilder<PlayerColor>();
    for (final userId in turnOrderByUserId!.toList()) {
      final color = players![userId]?.color;
      if (color != null) {
        list.add(color);
      }
    }
    return list.build();
  }

  @memoized
  bool get hasGameStarted {
    if (players == null || turnOrderByUserId == null) {
      return false;
    }
    for (final userId in turnOrderByUserId!.toList()) {
      final isReady = players![userId]?.isReady;
      if (isReady == false) {
        return false;
      }
    }
    return true;
  }

  @memoized
  PlayerColor? get playerColor {
    if (players == null || turnOrderByUserId == null) {
      return null;
    }
    final player = players![userId];
    if (player == null) {
      return null;
    }
    return player.color;
  }

  NetworkState._();
  factory NetworkState([void Function(NetworkStateBuilder) updates]) =
      _$NetworkState;

  Map<String, dynamic>? toMap() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  String toJson() => jsonEncode(serializers.serializeWith(serializer, this));

  static NetworkState? fromMap(Object object) =>
      serializers.deserializeWith(serializer, object);
  static NetworkState? fromJson(String jsonString) =>
      serializers.deserializeWith(serializer, jsonDecode(jsonString));
}
