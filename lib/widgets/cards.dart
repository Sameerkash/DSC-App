import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsckssem/models/event.dart';
import 'package:dsckssem/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:auto_route/auto_route.dart';

/// Event card to display [Event]s
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

/// ManageEvent card to edit and delete [Event]s
class ManageEventCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function onTap;
  final Function onEdit;
  final Function onDelete;

  const ManageEventCard({
    Key key,
    this.title,
    this.imageUrl,
    this.onTap,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: ListTile(
            onTap: onTap,
            leading: CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (_, img) {
                return CircleAvatar(
                  radius: 25,
                  backgroundImage: img,
                );
              },
            ),
            title: Row(
              children: [
                Text(title),
                Spacer(),
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
