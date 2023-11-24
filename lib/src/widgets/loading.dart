import 'package:flutter/material.dart';
import 'package:link_five/src/widgets/game_setup_container.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameSetupContainerWidget(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
