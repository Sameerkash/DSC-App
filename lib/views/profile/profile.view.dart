import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",  style: Theme.of(context).appBarTheme.textTheme.headline1),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
