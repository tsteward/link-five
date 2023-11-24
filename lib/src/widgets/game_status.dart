import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/widgets/color_box.dart';
import 'package:link_five/src/widgets/outlined_text.dart';
import 'package:link_five/src/model/game/game_state.dart';

class GameStatusWidget extends StatelessWidget {
  GameStatusWidget({
    Key? key,
    required this.players,
    required this.currentTurn,
    required this.userColor,
    required this.gameCode,
    required this.turnOrder,
    required this.turnNumber,
  }) : super(key: key);

  final List<Player> players;
  final PlayerColor currentTurn;
  final PlayerColor userColor;
  final String gameCode;
  final List<PlayerColor> turnOrder;
  final int turnNumber;
  

  @override
  Widget build(BuildContext context) {
  final remaingTilesMap = <PlayerColor,int> {};

    for (var i = 0; i<turnOrder.length; i++) {
      var playerColor = turnOrder[i];
      remaingTilesMap[playerColor] = GameState.tilesAvailablePerPlayer;
    }

    for (var i = 0; i<turnNumber; i++ ) {
      var playerColor = turnOrder [(i) % turnOrder.length];
      remaingTilesMap[playerColor] = remaingTilesMap[playerColor]! - 1;
    }

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
          name += ' Tiles: ';
          name += remaingTilesMap[player.color].toString();
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
