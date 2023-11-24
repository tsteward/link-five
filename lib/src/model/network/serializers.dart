import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/model/store/game_action.dart';
import 'package:link_five/src/model/store/game_start.dart';
import 'package:link_five/src/model/store/player.dart';

part 'serializers.g.dart';

@SerializersFor([
  GameAction,
  GameActionType,
  GameStart,
  PlaceTileAction,
  Player,
  PlayerColor,
  TileLocation,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
