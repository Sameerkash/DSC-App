import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/event.dart';
import '../../routes/router.gr.dart';
import 'event.vm.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.02.hp, left: 0.05.wp),
                child: Text("Events",
                    style: Theme.of(context).textTheme.headline1),
              ),
              context.watch<EventState>().map(
                  loading: (_) => Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (data) => Expanded(
                        child: CarouselSlider.builder(
                          itemCount: data.events.length,
                          itemBuilder: (context, index) {
                            return EventCard(
                              event: data.events[index],
                            );
                          },
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 0.75.hp,
                            // aspectRatio: 8 / 9,
                            enlargeCenterPage: true,
                            viewportFraction: 0.85,
                          ),
                        ),
                      ),
                  error: (_) => Text("err"))
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({
    Key key,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Color(int.tryParse(event.color)),
      child: Container(
          width: 0.8.wp,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text("${event.name}",
                      style: Theme.of(context).textTheme.headline2),
                ),
                Divider(
                  height: 1,
                  thickness: 2,
                ),
                CachedNetworkImage(
                  imageUrl: event.imageUrl,
                  imageBuilder: (_, imageProvider) {
                    return Container(
                      padding: EdgeInsets.all(3),
                      height: 0.35.hp,
                      // color: Colors.grey,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 0.02.hp,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 0.2.hp,
                    child: Text(event.description,
                        // "The Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: 0.1.wp, vertical: 0.015.hp),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(int.tryParse(event.secondaryColor)),
                  onPressed: () {
                    context.rootNavigator.push('/event-detail-view',
                        arguments: EventDetailViewArguments(event: event));
                  },
                  child: Text(
                    "Learn More",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
