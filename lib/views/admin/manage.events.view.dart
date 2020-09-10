import 'package:auto_route/auto_route.dart';
import 'package:dsckssem/views/events/event.vm.dart';
import 'package:dsckssem/widgets/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../routes/router.gr.dart';
import '../../widgets/cards.dart';
import 'manage.event.vm.dart';

class ManageEventsView extends StatelessWidget {
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
                              onEdit: () {
                                context.rootNavigator.push(
                                  '/event-form',
                                  arguments: EventFormArguments(
                                    event: data.event[index],
                                    isEditing: true,
                                  ),
                                );
                              },
                              onDelete: () async {
                                final res = await deleteDialog(context);
                                if (res) {
                                  showBlockingDialog(context);

                                  await context
                                      .read<ManagaeEventVM>()
                                      .deleteEvent(event: data.event[index]);
                                      
                                  await context.read<EventVM>().getEvents();
                                  context.rootNavigator.pop();
                                }
                              },
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
}
