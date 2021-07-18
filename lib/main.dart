import 'package:flutter/material.dart';
import 'package:link_five/src/logic/game.dart';
import 'package:link_five/src/model/player_color.dart';
import 'package:link_five/src/widgets/game_board_component/game_board_component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final game = Game(turnOrder: [PlayerColor.pink, PlayerColor.green]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBoardComponent(
        gameState: game.gameState,
        onClick: (location) {
          setState(() {
            game.applyAction(PlaceTileAction(
                playerColor: game.gameState.currentPlayer, location: location));
          });
        },
      ),
    );
  }
}
