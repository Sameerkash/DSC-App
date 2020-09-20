import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'routes/router.gr.dart';
import 'services/repository.dart';
import 'utils/theme.util.dart';
import 'views/admin/badge/badge.vm.dart';
import 'views/admin/events/manage.event.vm.dart';
import 'views/auth/auth.vm.dart';
import 'views/events/event.vm.dart';
import 'views/profile/profile.vm.dart';

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
        StateNotifierProvider<AuthVM, AuthState>(
          create: (_) => AuthVM(),
        ),
        StateNotifierProvider<EventVM, EventState>(
          create: (_) => EventVM(),
        ),
        StateNotifierProvider<ProfileVM, ProfileState>(
          create: (_) => ProfileVM(),
        ),
        StateNotifierProvider<ManagaeEventVM, ManageEventState>(
          create: (_) => ManagaeEventVM(),
        ),
        StateNotifierProvider<BadgeVM, BadgeState>(
          create: (_) => BadgeVM(),
        )
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
