import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/player.dart';

part 'serializers.g.dart';

@SerializersFor(const [Player, PlayerColor])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
