import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
import 'package:link_five/src/logic/game.dart';
import 'package:link_five/src/model/player_color.dart';
import 'package:link_five/src/widgets/game_board.dart';
import 'package:link_five/src/widgets/loading.dart';

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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _game = Game(turnOrder: [PlayerColor.pink, PlayerColor.green]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GameBoardWidget(
                gameState: _game.gameState,
                onClick: (location) {
                  setState(() {
                    _game.applyAction(PlaceTileAction(
                        playerColor: _game.gameState.currentPlayer,
                        location: location));
                  });
                },
              );
            }
            return LoadingWidget();
          }),
    );
  }
}
