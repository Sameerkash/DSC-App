import 'package:auto_route/auto_route_annotations.dart';

import '../views/admin/event.form.view.dart';
import '../views/admin/manage.events.view.dart';
import '../views/app.widget.dart';
import '../views/events/event_details.view.dart';

@CupertinoAutoRouter(routes: <AutoRoute>[
  CupertinoRoute(page: AppWidget, initial: true),
  CupertinoRoute(page: EventDetailView),
  CupertinoRoute(page: ManageEventsView),
  CupertinoRoute(page: EventForm),
], generateNavigationHelperExtension: true)
class $Router {}
