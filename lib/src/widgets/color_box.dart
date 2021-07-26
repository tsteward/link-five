import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/widgets/constants.dart';

class ColorBoxWidget extends StatelessWidget {
  ColorBoxWidget({
    Key? key,
    required this.color,
    this.hasCheckMark = false,
    this.onTap,
    this.enabled = true,
  }) : super(key: key);

  final PlayerColor color;
  final bool hasCheckMark;
  final Function()? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    if (hasCheckMark) {
      icon = Icon(
        Icons.check,
        color: enabled ? Colors.black : Colors.grey,
        size: 16,
      );
    }

    Color flutterColor = playerColorToFlutterColor[color]!;
    if (!enabled) {
      flutterColor = playerColorToFlutterColor[color]!.shade100;
    }

    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: flutterColor,
          border: Border.all(
            color: enabled ? Colors.black : Colors.grey,
            width: 2.0,
          ),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
