import 'package:flutter/material.dart';
import 'package:link_five/src/widgets/game_setup_container.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameSetupContainerWidget(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
