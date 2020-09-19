import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsckssem/widgets/dailog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:dsckssem/models/user.dart';

import 'manage.users.vm.dart';

class ManageUsersView extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search for a user",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.1.hp),
          child: Flexible(
            child: _HomeViewAppbar(),
          ),
        ),
      ),
      body: context.watch<ManageUserState>().map(
            loading: (_) => LinearProgressIndicator(),
            loaded: (data) => ListView.builder(
              itemCount: data.users.length,
              itemBuilder: (_, index) {
                return UserCard(
                  user: data.users[index],
                );
              },
            ),
            empty: (_) => Center(
              child: Text("Nothing here, Try Searching"),
            ),
          ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return StateNotifierProvider<ManageUserVM, ManageUserState>(
      create: (_) => ManageUserVM(),
      child: this,
    );
  }
}

class UserCard extends HookWidget {
  final AppUser user;
  const UserCard({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isAdmin = useState(user.isAdmin);
    return Padding(
      padding: EdgeInsets.all(0.05.wp),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(10),
            ),
        child: Container(
          // width: 0.7.wp,
          child: ExpandablePanel(
            header: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                user.userName,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.black),
              ),
            ),
            expanded: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "uid: ${user.uid}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 13)
                        .copyWith(color: Colors.black),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 0.01.hp,
                  ),
                  Text(
                    "email: ${user.email}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 13)
                        .copyWith(color: Colors.black),
                    softWrap: true,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          MaterialCommunityIcons.medal,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      if (isAdmin.value)
                        IconButton(
                          icon: Icon(
                            MaterialCommunityIcons.account_check,
                            color: Colors.black,
                          ),
                          onPressed: () async {
                            final res = await actionDialog(
                              context,
                              title: "Sure you want to Proceed ?",
                              subtitle: "Remove from Admin",
                            );
                            if (res) {
                              showBlockingDialog(context);

                              await context
                                  .read<ManageUserVM>()
                                  .makeUserAdmin(value: false, uid: user.uid);
                              isAdmin.value = false;
                              context.rootNavigator.pop();
                            }
                          },
                        ),
                      if (!isAdmin.value)
                        IconButton(
                          icon: Icon(
                            MaterialCommunityIcons.account,
                            color: Colors.black,
                          ),
                          onPressed: () async {
                            final res = await actionDialog(
                              context,
                              title: "Sure you want to Proceed ?",
                              subtitle: "Make this person Admin",
                            );
                            if (res) {
                              showBlockingDialog(context);

                              await context
                                  .read<ManageUserVM>()
                                  .makeUserAdmin(value: true, uid: user.uid);
                              isAdmin.value = true;
                              context.rootNavigator.pop();
                            }
                          },
                        ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          final res = await actionDialog(
                            context,
                            title: "Sure you want to Delete User?",
                            subtitle: "This Action cannot be Undone",
                          );
                          if (res) {
                            showBlockingDialog(context);
                            context
                                .read<ManageUserVM>()
                                .deleteUser(uid: user.uid, user: user);
                            context.rootNavigator.pop();
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeViewAppbar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var search = useTextEditingController(text: '');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(color: Colors.white),
          width: 0.87.wp,
          child: ListTile(
            title: TextField(
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
              controller: search,
              onSubmitted: (val) {
                context.read<ManageUserVM>().searchUser(userName: val);
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: 'Search...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Colors.black),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
