import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'routes/router.gr.dart';
import 'services/repository.dart';
import 'utils/theme.util.dart';
import 'views/events/event.vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AppRepository(),
        ),
        StateNotifierProvider<EventVM, EventState>(
          create: (_) => EventVM(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        builder: ExtendedNavigator.builder(
            router: Router(), builder: DevicePreview.appBuilder),
      ),
    );
  }
}
