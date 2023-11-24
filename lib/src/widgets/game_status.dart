import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/widgets/color_box.dart';
import 'package:link_five/src/widgets/outlined_text.dart';
import 'package:link_five/src/model/game/game_state.dart';

class GameStatusWidget extends StatelessWidget {
  const GameStatusWidget({
    super.key,
    required this.players,
    required this.currentTurn,
    required this.userColor,
    required this.gameCode,
    required this.turnOrder,
    required this.turnNumber,
  });

  final List<Player> players;
  final PlayerColor currentTurn;
  final PlayerColor userColor;
  final String gameCode;
  final List<PlayerColor> turnOrder;
  final int turnNumber;

  @override
  Widget build(BuildContext context) {
    final remaingTilesMap = <PlayerColor, int>{};
    final roundsPlayed = turnNumber ~/ turnOrder.length;
    for (var i = 0; i < turnOrder.length; i++) {
      final playerColor = turnOrder[i];
      remaingTilesMap[playerColor] =
          GameState.tilesAvailablePerPlayer - roundsPlayed;
    }
    final turnsPlayedThisRound = turnNumber % turnOrder.length;
    for (var i = 0; i < turnsPlayedThisRound; i++) {
      final playerColor = turnOrder[i];
      remaingTilesMap[playerColor] = remaingTilesMap[playerColor]! - 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const OutlinedText(
                'Game Code: ',
                style: TextStyle(fontSize: 24.0),
              ),
              OutlinedText(
                gameCode,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                selectable: true,
              ),
            ],
          ),
        ),
        ...List.generate(players.length, (i) {
          final player = players[i];
          var nameStyle = const TextStyle();
          var name = player.name;
          if (player.color == currentTurn) {
            nameStyle = const TextStyle(fontWeight: FontWeight.bold);
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
                const SizedBox(width: 8.0),
                OutlinedText(name, style: nameStyle),
              ],
            ),
          );
        }),
      ],
    );
  }
}
