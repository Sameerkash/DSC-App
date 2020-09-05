import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: SizedBox.shrink(),
              expandedHeight: 0.3.hp,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Explore ML",
                  style: Theme.of(context).textTheme.headline1,
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(left: 0.05.wp, top: 0.02.hp, right: 0.05.wp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 0.05.hp,
                ),
                Text(
                  "The Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications The Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applicationsThe Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 0.05.hp,
                ),
                Row(
                  children: [
                    Text(
                      "Attendees: ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "250",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.05.hp,
                ),
                Text(
                  "Badges to Collect",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 0.15.hp,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.3.wp, vertical: 0.02.hp),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.purple,
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
