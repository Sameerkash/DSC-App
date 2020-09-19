import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsckssem/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../models/event.dart';
import '../auth/auth.vm.dart';
import 'profile.vm.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: context.watch<ProfileState>().map(
                loading: (_) => LinearProgressIndicator(),
                loaded: (data) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.02.hp, left: 0.05.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Profile",
                                style: Theme.of(context).textTheme.headline1),
                            IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {
                                context.rootNavigator.push(
                                  '/edit-profile',
                                  arguments:
                                      EditProfileArguments(user: data.user),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 0.03.wp,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.grey[350],
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: 0.2.hp,
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: data.user.imageUrl,
                                imageBuilder: (_, img) {
                                  return CircleAvatar(
                                    radius: 50,
                                    backgroundImage: img,
                                  );
                                },
                              ),
                              SizedBox(
                                width: 0.03.wp,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "${data.user.userName}",
                                  style: Theme.of(context).textTheme.bodyText2,
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.02.hp, left: 0.05.wp),
                        child: Text("My Events"),
                      ),
                      SizedBox(
                        width: 0.03.hp,
                      ),
                      ListView.builder(
                        itemCount: data.events.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return MyEventCard(
                            event: data.events[index],
                          );
                        },
                      ),
                    
                    ],
                  ),
                ),
                error: (err) => Center(
                  child: Text("Error"),
                ),
              ),
        ),
      ),
    );
  }
}

class MyEventCard extends StatelessWidget {
  final Event event;
  const MyEventCard({
    Key key,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(int.tryParse(event.color)),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: event.imageUrl,
          imageBuilder: (_, img) {
            return Container(
              height: 0.05.hp,
              width: 0.1.wp,
              decoration: BoxDecoration(
                image: DecorationImage(image: img, fit: BoxFit.contain),
              ),
            );
          },
        ),
        title: AutoSizeText(
          event.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
          "${event.attendees} went to this event",
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
