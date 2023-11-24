import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/store/player.dart';
import 'package:link_five/src/widgets/color_box.dart';
import 'package:link_five/src/widgets/color_picker.dart';
import 'package:link_five/src/widgets/game_setup_container.dart';

class SetupPlayersWidget extends StatefulWidget {
  const SetupPlayersWidget({
    super.key,
    required this.onPlayerInfoChanged,
    required this.userId,
    required this.gameCode,
    required this.players,
  });

  final Function(Player name) onPlayerInfoChanged;
  final String userId;
  final String gameCode;
  final Map<String, Player> players;

  @override
  SetupPlayersWidgetState createState() => SetupPlayersWidgetState();
}

class SetupPlayersWidgetState extends State<SetupPlayersWidget> {
  final _gameCodeController = TextEditingController();

  Player? get _player => widget.players[widget.userId];

  @override
  void dispose() {
    super.dispose();
    _gameCodeController.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (_player != null) {
      _gameCodeController.text = _player!.name;

      _gameCodeController.addListener(
        () => widget.onPlayerInfoChanged(
            _player!.rebuild((b) => b..name = _gameCodeController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final playerRows = <Widget>[];
    final otherPlayerColors = <PlayerColor>{};

    for (final playerId in widget.players.keys) {
      final player = widget.players[playerId]!;
      final isUser = playerId == widget.userId;

      if (!isUser) {
        otherPlayerColors.add(player.color);
      }

      var name = player.name;
      var nameStyle = const TextStyle();
      if (isUser) {
        name += ' (You)';
        nameStyle = const TextStyle(fontWeight: FontWeight.bold);
      }

      Widget? readyIcon;
      if (player.isReady) {
        readyIcon = const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        );
      }

      playerRows.add(
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          title: Wrap(
            children: [
              ColorBoxWidget(color: player.color),
              const SizedBox(width: 8.0),
              Text(name, style: nameStyle),
            ],
          ),
          trailing: readyIcon,
        ),
      );
    }

    return GameSetupContainerWidget(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          title: const Text('Game Code'),
          trailing: SelectableText(widget.gameCode),
        ),
        if (_player != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              enabled: !_player!.isReady,
              controller: _gameCodeController,
            ),
          ),
        if (_player != null)
          ColorPickerWidget(
            selectedColor: _player!.color,
            onColorSelected: (color) => widget.onPlayerInfoChanged(
              _player!.rebuild((b) => b..color = color),
            ),
            disabledColors: otherPlayerColors,
            enabled: !_player!.isReady,
          ),
        ...playerRows,
        if (_player != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _player!.isReady
                  ? null
                  : () => widget.onPlayerInfoChanged(
                        _player!.rebuild((b) => b..isReady = true),
                      ),
              child: const Text('Ready'),
            ),
          ),
      ],
    );
  }
}
