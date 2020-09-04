import 'package:auto_route/auto_route_annotations.dart';

import '../views/app.widget.dart';
import '../views/events/event_details.view.dart';

@CupertinoAutoRouter(routes: <AutoRoute>[
  CupertinoRoute(page: AppWidget, initial: true),
  CupertinoRoute(page: EventDetailView),
], generateNavigationHelperExtension: true)
class $Router {}
