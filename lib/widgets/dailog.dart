import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

Future<bool> actionDialog(BuildContext context,
    {String title, String subtitle}) async {
  final res = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        content: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              context.rootNavigator.pop(false);
            },
          ),
          FlatButton(
            child: Text("Continue"),
            onPressed: () {
              context.rootNavigator.pop(true);
            },
          )
        ],
      );
    },
  );

  return res;
}

void showBlockingDialog(BuildContext context) {
  showDialog<dynamic>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}
