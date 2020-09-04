import 'package:auto_route/auto_route.dart';
import 'package:dsckssem/routes/router.gr.dart';
import 'package:dsckssem/views/app.widget.dart';
import 'package:flutter/material.dart';

import 'utils/theme.util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      builder: ExtendedNavigator.builder(router: Router()),
    );
  }
}
