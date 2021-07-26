import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/widgets/color_box.dart';
import 'package:link_five/src/widgets/outlined_text.dart';

class GameStatusWidget extends StatelessWidget {
  GameStatusWidget({
    Key? key,
    required this.players,
    required this.currentTurn,
    required this.userColor,
    required this.gameCode,
  }) : super(key: key);

  final List<Player> players;
  final PlayerColor currentTurn;
  final PlayerColor userColor;
  final String gameCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              OutlinedText(
                'Game Code: ',
                style: TextStyle(fontSize: 24.0),
              ),
              OutlinedText(
                gameCode,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                selectable: true,
              ),
            ],
          ),
        ),
        ...List.generate(players.length, (i) {
          final player = players[i];
          var nameStyle = TextStyle();
          var name = player.name;
          if (player.color == currentTurn) {
            nameStyle = TextStyle(fontWeight: FontWeight.bold);
          }
          if (player.color == userColor) {
            name += ' (You)';
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ColorBoxWidget(color: player.color),
                SizedBox(width: 8.0),
                OutlinedText(name, style: nameStyle),
              ],
            ),
          );
        }),
      ],
    );
  }
}
