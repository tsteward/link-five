import 'package:flutter/material.dart';

class GameSetupContainerWidget extends StatelessWidget {
  GameSetupContainerWidget({Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Center(
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
