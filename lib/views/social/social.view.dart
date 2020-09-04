import 'package:flutter/material.dart';

class SocialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updates",
            style: Theme.of(context).appBarTheme.textTheme.headline1),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
