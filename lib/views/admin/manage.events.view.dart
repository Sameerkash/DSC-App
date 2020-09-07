import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../widgets/cards.dart';
import 'manage.event.vm.dart';

class ManageEventsView extends StatelessWidget with AutoRouteWrapper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 0.02.wp, right: 0.02.wp),
          child: Column(
            children: [
              Text("Manage Events",
                  style: Theme.of(context).textTheme.headline1),
              context.watch<ManageEventState>().map(
                  loading: (_) => LinearProgressIndicator(),
                  loaded: (data) => Expanded(
                        child: ListView.builder(
                          itemCount: data.event.length,
                          itemBuilder: (_, index) {
                            return ManageEventCard(
                              title: "${data.event[index].name}",
                              imageUrl: data.event[index].imageUrl,
                              onEdit: () {},
                            );
                          },
                        ),
                      ),
                  error: (_) => Text("err")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.rootNavigator.push('/event-form');
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return StateNotifierProvider<ManagaeEventVM, ManageEventState>(
      create: (_) => ManagaeEventVM(),
      child: this,
    );
  }
}
