import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/widgets/color_box.dart';

class PlayersDisplayWidget extends StatelessWidget {
  PlayersDisplayWidget({
    Key? key,
    required this.players,
    required this.currentTurn,
    required this.userColor,
  }) : super(key: key);

  final List<Player> players;
  final PlayerColor currentTurn;
  final PlayerColor userColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(players.length, (i) {
        final player = players[i];
        var nameStyle = TextStyle();
        var name = player.name;
        if (player.color == currentTurn) {
          nameStyle = TextStyle(fontWeight: FontWeight.bold);
        }
        if (player.color == userColor) {
          name += ' (You)';
        }
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          title: Wrap(
            children: [
              ColorBoxWidget(color: player.color),
              SizedBox(width: 8.0),
              Text(name, style: nameStyle),
            ],
          ),
        );
      }),
    );
  }
}
