import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/model/network/player.dart';
import 'package:link_five/src/widgets/color_box.dart';
import 'package:link_five/src/widgets/color_picker.dart';
import 'package:link_five/src/widgets/game_setup_container.dart';

class SetupPlayersWidget extends StatefulWidget {
  SetupPlayersWidget({
    Key? key,
    required this.onPlayerInfoChanged,
    required this.userId,
    required this.gameCode,
    required this.players,
  }) : super(key: key);

  final Function(Player name) onPlayerInfoChanged;
  final String userId;
  final String gameCode;
  final Map<String, Player> players;

  @override
  _SetupPlayersWidgetState createState() => _SetupPlayersWidgetState();
}

class _SetupPlayersWidgetState extends State<SetupPlayersWidget> {
  final _gameCodeController = TextEditingController();

  Player? get _player => widget.players[widget.userId];

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
      var nameStyle = TextStyle();
      if (isUser) {
        name += ' (You)';
        nameStyle = TextStyle(fontWeight: FontWeight.bold);
      }

      Widget? readyIcon;
      if (player.isReady) {
        readyIcon = Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        );
      }

      playerRows.add(
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          title: Wrap(
            children: [
              ColorBoxWidget(color: player.color),
              SizedBox(width: 8.0),
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
          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          title: Text('Game Code'),
          trailing: SelectableText(widget.gameCode),
        ),
        if (_player != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
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
              child: Text('Ready'),
            ),
          ),
      ],
    );
  }
}
