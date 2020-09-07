// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/event.dart';
import '../views/admin/event.form.view.dart';
import '../views/admin/manage.events.view.dart';
import '../views/app.widget.dart';
import '../views/events/event_details.view.dart';

class Routes {
  static const String appWidget = '/';
  static const String eventDetailView = '/event-detail-view';
  static const String manageEventsView = '/manage-events-view';
  static const String eventForm = '/event-form';
  static const all = <String>{
    appWidget,
    eventDetailView,
    manageEventsView,
    eventForm,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.appWidget, page: AppWidget),
    RouteDef(Routes.eventDetailView, page: EventDetailView),
    RouteDef(Routes.manageEventsView, page: ManageEventsView),
    RouteDef(Routes.eventForm, page: EventForm),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AppWidget: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AppWidget(),
        settings: data,
      );
    },
    EventDetailView: (data) {
      final args = data.getArgs<EventDetailViewArguments>(
        orElse: () => EventDetailViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => EventDetailView(
          key: args.key,
          event: args.event,
        ),
        settings: data,
      );
    },
    ManageEventsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ManageEventsView().wrappedRoute(context),
        settings: data,
      );
    },
    EventForm: (data) {
      final args = data.getArgs<EventFormArguments>(
        orElse: () => EventFormArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => EventForm(
          key: args.key,
          isEditing: args.isEditing,
          event: args.event,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushAppWidget() => push<dynamic>(Routes.appWidget);

  Future<dynamic> pushEventDetailView({
    Key key,
    Event event,
  }) =>
      push<dynamic>(
        Routes.eventDetailView,
        arguments: EventDetailViewArguments(key: key, event: event),
      );

  Future<dynamic> pushManageEventsView() =>
      push<dynamic>(Routes.manageEventsView);

  Future<dynamic> pushEventForm({
    Key key,
    bool isEditing = false,
    Event event,
  }) =>
      push<dynamic>(
        Routes.eventForm,
        arguments:
            EventFormArguments(key: key, isEditing: isEditing, event: event),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EventDetailView arguments holder class
class EventDetailViewArguments {
  final Key key;
  final Event event;
  EventDetailViewArguments({this.key, this.event});
}

/// EventForm arguments holder class
class EventFormArguments {
  final Key key;
  final bool isEditing;
  final Event event;
  EventFormArguments({this.key, this.isEditing = false, this.event});
}
