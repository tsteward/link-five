import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/network/network.dart';
import 'package:link_five/src/logic/actions/place_tile_action.dart';
import 'package:link_five/src/logic/game.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/network_state.dart';
import 'package:link_five/src/widgets/game_board.dart';
import 'package:link_five/src/widgets/game_grid.dart';
import 'package:link_five/src/widgets/setup_game_code.dart';
import 'package:link_five/src/widgets/loading.dart';
import 'package:link_five/src/widgets/setup_players.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Link Five',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  final Network _network = Network();
  final _preGame = Game(turnOrder: PlayerColor.values.toList());
  Game? _game;

  GameState _preGameState = GameState();
  GameState? _gameState;
  NetworkState _networkState = NetworkState();
  Future<void>? _initialization;

  @override
  void initState() {
    super.initState();

    setState(() {
      _preGameState = _preGame.state;
      _networkState = _network.state;
      _initialization = initialize();
    });

    _preGame.stateStream.listen(
      (gameState) => setState(() => _preGameState = gameState),
    );
    _network.stateStream.listen(
      (networkState) => setState(() => _networkState = networkState),
    );
    _network.stateStream
        .firstWhere((state) => state.hasGameStarted)
        .then((_) => _startGame());
  }

  _startGame() {
    _game = Game(turnOrder: _networkState.turnOrderByColor?.toList() ?? []);

    setState(() {
      _gameState = _game!.state;
    });
    _game!.stateStream.listen(
      (gameState) => setState(() => _gameState = gameState),
    );

    _network.setApplyActionCallback(_game!.applyAction);
  }

  Future<void> initialize() async {
    await Firebase.initializeApp();
    await _network.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            Widget? setupWidget;
            if (snapshot.connectionState != ConnectionState.done) {
              setupWidget = LoadingWidget();
            } else if (_networkState.gameCode == null) {
              setupWidget = _setupGameCode(context);
            } else if (_networkState.players != null &&
                !_networkState.hasGameStarted) {
              setupWidget = _setupPlayers(context);
            } else if (_networkState.hasGameStarted) {
              setupWidget = null;
            } else {
              setupWidget = LoadingWidget();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  _gameGrid(context),
                  _gameBoard(context),
                  if (setupWidget != null) setupWidget,
                ],
              );
            }
            return LoadingWidget();
          }),
    );
  }

  Widget _gameBoard(BuildContext context) => GameBoardWidget(
      gameState: _gameState ?? _preGameState, onClick: _handleGameClick);

  Widget _gameGrid(BuildContext context) => GameGridWidget();

  Widget _setupGameCode(BuildContext context) => SetupGameCodeWidget(
        onJoinGameClicked: (String gameCode) => _network.joinGame(gameCode),
        onNewGameClicked: () => _network.createGame(),
      );

  Widget _setupPlayers(BuildContext context) => SetupPlayersWidget(
        onPlayerInfoChanged: (player) => _network.changePlayerInfo(player),
        userId: _networkState.userId!,
        gameCode: _networkState.gameCode!,
        players: _networkState.players!.asMap(),
      );

  void _handleGameClick(TileLocation location) {
    if (_game == null) {
      _preGame.applyAction(
        PlaceTileAction(
          playerColor: _preGameState.currentPlayer,
          location: location,
        ),
      );
    } else {
      final action = PlaceTileAction(
        playerColor: _networkState.playerColor!,
        location: location,
      );

      if (_game!.isPermitted(action)) {
        _network.sendAction(action);
      }
    }
  }
}
