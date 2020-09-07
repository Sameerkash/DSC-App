import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

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
              ManageEventCard(
                title: "Explore ML",
              )
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

class ManageEventCard extends StatelessWidget {
  final String title;
  final Function onTap;
  final Function onEdit;
  final Function onDelete;

  final IconData icon;
  const ManageEventCard({
    Key key,
    this.title,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: ListTile(
            onTap: onTap,
            leading: CircleAvatar(
                // backgroundImage: ,
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
