import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

Future<bool> deleteDialog(BuildContext context) async {
  final res = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Sure you want to delete this Event?",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        content: Text(
          "Action cannot be undone",
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
