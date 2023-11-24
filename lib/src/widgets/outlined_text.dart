import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final bool selectable;

  const OutlinedText(
    this.data, {
    super.key,
    required this.style,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          data,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.white,
          ),
        ),
        // Solid text as fill.
        if (!selectable) Text(data, style: style),
        if (selectable) SelectableText(data, style: style),
      ],
    );
  }
}
