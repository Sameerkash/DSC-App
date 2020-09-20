import 'package:auto_route/auto_route_annotations.dart';

import '../views/admin/badge/badge.view.dart';
import '../views/admin/events/event.form.view.dart';
import '../views/admin/events/manage.events.view.dart';
import '../views/admin/scanner/scanner.view.dart';
import '../views/admin/users/manage.users.view.dart';
import '../views/app.widget.dart';
import '../views/events/event_details.view.dart';
import '../views/profile/edit.profile.view.dart';

@CupertinoAutoRouter(routes: <AutoRoute>[
  CupertinoRoute(page: AppWidget, initial: true),
  CupertinoRoute(page: EventDetailView),
  CupertinoRoute(page: ManageEventsView),
  CupertinoRoute(page: EventForm),
  CupertinoRoute(page: ScannerView),
  CupertinoRoute(page: ManageUsersView),
  CupertinoRoute(page: EditProfile),
  CupertinoRoute(page: BadgeView),
], generateNavigationHelperExtension: true)
class $Router {}
