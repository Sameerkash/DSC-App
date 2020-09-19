import 'package:auto_route/auto_route_annotations.dart';

import '../views/admin/events/event.form.view.dart';
import '../views/admin/events/manage.events.view.dart';
import '../views/admin/scanner/scanner.view.dart';
import '../views/admin/users/manage.users.view.dart';
import '../views/app.widget.dart';
import '../views/events/event_details.view.dart';

@CupertinoAutoRouter(routes: <AutoRoute>[
  CupertinoRoute(page: AppWidget, initial: true),
  CupertinoRoute(page: EventDetailView),
  CupertinoRoute(page: ManageEventsView),
  CupertinoRoute(page: EventForm),
  CupertinoRoute(page: ScannerView),
  CupertinoRoute(page: ManageUsersView),
], generateNavigationHelperExtension: true)
class $Router {}
