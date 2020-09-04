import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Upcoming Events",
      //       style: Theme.of(context).appBarTheme.textTheme.headline1),
      // ),
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
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, indedx) {
                    return Card(
                      color: Colors.deepPurple[700],
                      child: Container(
                          width: 0.8.wp,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Explore ML",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 2,
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  height: 0.35.hp,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 0.02.hp,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 0.2.hp,
                                    child: Text(
                                        "The Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 7,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ),
                                ),
                                RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.2.wp, vertical: 0.015.hp),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Colors.purple,
                                  onPressed: () {},
                                  child: Text(
                                    "Register",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                )
                              ],
                            ),
                          )),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
