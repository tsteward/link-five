import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:link_five/src/widgets/game_setup_container.dart';

class SetupGameCodeWidget extends StatefulWidget {
  SetupGameCodeWidget({
    Key? key,
    required this.onJoinGameClicked,
    required this.onNewGameClicked,
  }) : super(key: key);

  final Function(String gameCode) onJoinGameClicked;
  final Function() onNewGameClicked;

  @override
  _SetupGameCodeWidgetState createState() => _SetupGameCodeWidgetState();
}

class _SetupGameCodeWidgetState extends State<SetupGameCodeWidget> {
  final _gameCodeController = TextEditingController();

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
            decoration: InputDecoration(labelText: 'Game Code'),
            controller: _gameCodeController,
            onEditingComplete: () => widget.onJoinGameClicked(_gameCodeController.text),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => widget.onJoinGameClicked(_gameCodeController.text),
            child: Text('Join Game'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => widget.onNewGameClicked(),
            child: Text('New Game'),
          ),
        ),
      ],
    );
  }
}
