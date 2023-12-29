import 'dart:math';
import 'package:flutter/material.dart';
import 'package:link_five/src/model/game/game_state.dart';
import 'package:link_five/src/widgets/game_board/constants.dart';

extension SizeCalculator on GameState {
  double calculateScaledSize(Size size) {
    double scaledSize =
        min(size.width / (xRange + margin), size.height / (yRange + margin));
    scaledSize = min(scaledSize, maxTileSize);

    return scaledSize;
  }
}
