import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/player_color.dart';
import 'package:link_five/src/widgets/color_box.dart';

class ColorPickerWidget extends StatelessWidget {
  ColorPickerWidget({
    Key? key,
    required this.selectedColor,
    required this.onColorSelected,
    this.disabledColors = const {},
    this.enabled = true,
  }) : super(key: key);

  final PlayerColor? selectedColor;
  final Function(PlayerColor) onColorSelected;
  final Set<PlayerColor> disabledColors;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: PlayerColor.values
            .toList()
            .map((e) => ColorBoxWidget(
                  color: e,
                  hasCheckMark: e == selectedColor,
                  onTap: () => onColorSelected(e),
                  enabled: enabled && !disabledColors.contains(e),
                ))
            .toList(),
      ),
    );
  }
}
