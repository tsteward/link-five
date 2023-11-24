import 'package:flutter/material.dart';
import 'package:link_five/src/logic/interaction/click_handler.dart';
import 'package:link_five/src/logic/game_action.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/model/game/tile_location.dart';
import 'package:link_five/src/network/network.dart';
import 'package:link_five/src/logic/game.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/network_state.dart';
import 'package:link_five/src/widgets/game_board.dart';
import 'package:link_five/src/widgets/game_grid.dart';
import 'package:link_five/src/widgets/game_status.dart';
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
  final ClickHandler _clickHandler = ClickHandler();
  Game? _game;

  GameState _preGameState = GameState();
  GameState? _gameState;
  TileLocation? _selectedLocation;
  NetworkState _networkState = NetworkState();
  Future<void>? _initialization;

  @override
  void initState() {
    super.initState();

    setState(() {
      _preGameState = _preGame.state;
      _networkState = _network.state;
      _selectedLocation = _clickHandler.selectedLocation;
      _initialization = initialize();
    });

    _preGame.stateStream.listen(
      (gameState) => setState(() => _preGameState = gameState),
    );
    _network.stateStream.listen(
      (networkState) => setState(() => _networkState = networkState),
    );
    _clickHandler.stateStream.listen(
      (source) => setState(() => _selectedLocation = source),
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
                  if (_networkState.players != null &&
                      _gameState?.currentPlayer != null)
                    _gameStatusWidget(context),
                ],
              );
            }
            return LoadingWidget();
          }),
    );
  }

  Widget _gameBoard(BuildContext context) {
    late PlayerColor color;
    if (_game == null) {
      color = _preGameState.currentPlayer;
    } else {
      color = _networkState.playerColor!;
    }

    return GameBoardWidget(
      gameState: _gameState ?? _preGameState,
      onClick: _handleGameClick,
      playerColor: color,
      selectedLocation: _selectedLocation,
    );
  }

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

  Widget _gameStatusWidget(BuildContext context) => GameStatusWidget(
        players: _networkState.players!.values.toList(),
        currentTurn: _gameState!.currentPlayer,
        userColor: _networkState.playerColor!,
        gameCode: _networkState.gameCode ?? '',
        turnOrder: _gameState!.turnOrder.asList(),
        turnNumber: _gameState!.turnNumber,
      );

  void _handleGameClick(TileLocation location) {
    GameAction? action;
    if (_game == null) {
      action = _clickHandler.handleGameClick(
          _preGame.state, location, _preGameState.currentPlayer);
    } else {
      action = _clickHandler.handleGameClick(
          _game!.state, location, _gameState!.currentPlayer);
    }
    if (action == null) {
      return;
    }
    if (_game == null) {
      _preGame.applyAction(action);
    } else if (_game!.isPermitted(action)) {
      _network.sendAction(action);
    }
  }
}
