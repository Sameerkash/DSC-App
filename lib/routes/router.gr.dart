// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/event.dart';
import '../views/app.widget.dart';
import '../views/events/event_details.view.dart';

class Routes {
  static const String appWidget = '/';
  static const String eventDetailView = '/event-detail-view';
  static const all = <String>{
    appWidget,
    eventDetailView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.appWidget, page: AppWidget),
    RouteDef(Routes.eventDetailView, page: EventDetailView),
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
