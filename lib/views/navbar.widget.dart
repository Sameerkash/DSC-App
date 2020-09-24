import 'package:dsckssem/views/explore/explore.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin/admin_home/admin.view.dart';
import 'events/events.view.dart';
import 'profile/profile.view.dart';

class NavBarPage extends StatefulWidget {
  final bool isAdmin;
  const NavBarPage({
    Key key,
    this.isAdmin = false,
  }) : super(key: key);
  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  void initState() {
    setNav();
    super.initState();
  }

  List<Widget> screens = [];

  void setNav() {
    if (widget.isAdmin) {
      screens = [
        EventsView(),
        Explore(),
        ProfileView(),
        AdminView(),
      ];
    } else {
      screens = [
        EventsView(),
        Explore(),
        ProfileView(),
      ];
    }
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: screens[_selectedIndex],
          ),
          NavigationRail(
            elevation: 1,
            minWidth: 0.09.wp,
            groupAlignment: 0.0,
            backgroundColor: Colors.black,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                selectedIcon: SizedBox.shrink(),
                icon: SizedBox.shrink(),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'Events',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
              // NavigationRailDestination(
              //   icon: SizedBox.shrink(),
              //   selectedIcon: SizedBox.shrink(),
              //   // selectedIcon: Icon(Icons.favorite),
              //   label: RotatedBox(quarterTurns: -1, child: Text('Social')),
              // ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                selectedIcon: SizedBox.shrink(),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'Explore',
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                selectedIcon: SizedBox.shrink(),
                // selectedIcon: Icon(Icons.favorite),
                label: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.greenAccent),
                    )),
              ),
              if (widget.isAdmin)
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  selectedIcon: SizedBox.shrink(),
                  // selectedIcon: Icon(Icons.favorite),
                  label: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        'Admin',
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
        ],
      ),
    );
  }
}

//   return PersistentTabView(
//     // navBarHeight: SizeConfig.safeBlockVertical * 7.5,
//     controller: _controller,
//     items: _navBarsItems(),
//     screens: _buildScreens(),
//     // showElevation: true,

//     confineInSafeArea: true,
//     // backgroundColor: Colors.grey[200],
//     handleAndroidBackButtonPress: true,
//     iconSize: 30.0,
//     navBarStyle:
//         NavBarStyle.style7, // Choose the nav bar style with this property
//     onItemSelected: (index) {
//       setState(() {
//         _controller.index = index;
//       });
//     },
//   );
//  List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(MaterialCommunityIcons.ticket),
//       title: ("Events"),
//       activeColor: Colors.red,
//       activeContentColor: Colors.white,
//       inactiveColor: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(MaterialCommunityIcons.text),
//       title: ("Social"),
//       activeColor: Colors.blue,
//       activeContentColor: Colors.white,
//       inactiveColor: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(Icons.mail_outline),
//       title: ("Join"),
//       activeContentColor: Colors.white,
//       activeColor: Colors.green,
//       inactiveColor: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       activeContentColor: Colors.white,
//       icon: Icon(Icons.portrait),
//       title: ("Profile"),
//       activeColor: Colors.yellow,
//       inactiveColor: CupertinoColors.systemGrey,
//     ),
//   ];
// }

// List<Widget> _buildScreens() {
//   return [
//     EventsView(),
//     SocialView(),
//     InfoView(),
//     ProfileView(),
//   ];
// }
