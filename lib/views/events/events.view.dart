import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/cards.dart';
import 'event.vm.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.02.hp, left: 0.05.wp),
                child: Text("Events",
                    style: Theme.of(context).textTheme.headline1),
              ),
              context.watch<EventState>().map(
                  loading: (_) => Center(
                        child: LinearProgressIndicator(),
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
