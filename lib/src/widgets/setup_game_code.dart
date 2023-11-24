import 'package:flutter/material.dart';
import 'package:link_five/src/widgets/game_setup_container.dart';

class SetupGameCodeWidget extends StatefulWidget {
  const SetupGameCodeWidget({
    super.key,
    required this.onJoinGameClicked,
    required this.onNewGameClicked,
  });

  final Function(String gameCode) onJoinGameClicked;
  final Function() onNewGameClicked;

  @override
  SetupGameCodeWidgetState createState() => SetupGameCodeWidgetState();
}

class SetupGameCodeWidgetState extends State<SetupGameCodeWidget> {
  final _gameCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _gameCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GameSetupContainerWidget(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Game Code'),
            controller: _gameCodeController,
            onEditingComplete: () =>
                widget.onJoinGameClicked(_gameCodeController.text),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => widget.onJoinGameClicked(_gameCodeController.text),
            child: const Text('Join Game'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => widget.onNewGameClicked(),
            child: const Text('New Game'),
          ),
        ),
      ],
    );
  }
}
