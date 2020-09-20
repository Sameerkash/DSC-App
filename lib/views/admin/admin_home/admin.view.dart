import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0.05.hp, left: 0.02, right: 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AdminCard(
                title: "Manage Events",
                icon: Icons.calendar_today,
                onTap: () {
                  context.rootNavigator.push('/manage-events-view');
                },
              ),
              AdminCard(
                title: "Manage Users",
                icon: Icons.portrait,
                onTap: () {
                  context.rootNavigator.push('/manage-users-view');
                },
              ),
              AdminCard(
                title: "Scan QR Code",
                icon: Icons.calendar_today,
                onTap: () {
                  context.rootNavigator.push('/scanner-view');
                },
              ),
              AdminCard(
                title: "Add a Badge",
                icon: MaterialCommunityIcons.medal,
                onTap: () {
                  context.rootNavigator.push('/badge-view');
                },
              ),
              AdminCard(
                title: "FeedBack",
                icon: Icons.mail_outline,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminCard extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;
  const AdminCard({
    Key key,
    this.title,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: AutoSizeText(title),
        ),
      ),
    );
  }
}
