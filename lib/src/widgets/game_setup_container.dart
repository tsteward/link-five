import 'package:flutter/material.dart';

class GameSetupContainerWidget extends StatelessWidget {
  const GameSetupContainerWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            const Center(
              child: Text(
                'Link Five',
                style: TextStyle(fontSize: 36),
                textAlign: TextAlign.center,
              ),
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
