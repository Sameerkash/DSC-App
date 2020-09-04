import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join us",   style: Theme.of(context).appBarTheme.textTheme.headline1),
        backgroundColor: Colors.green,
      ),
    );
  }
}
