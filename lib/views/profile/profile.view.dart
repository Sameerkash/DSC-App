import '../auth/auth.vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
            style: Theme.of(context).appBarTheme.textTheme.headline1),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            await context.read<AuthVM>().signOut();
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
