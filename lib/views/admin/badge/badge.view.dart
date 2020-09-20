import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsckssem/routes/router.gr.dart';
import 'package:dsckssem/widgets/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import 'badge.vm.dart';

class BadgeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Badges"),
      ),
      body: context.watch<BadgeState>().map(
            loading: (_) => LinearProgressIndicator(),
            loaded: (data) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: RefreshIndicator(
                onRefresh: () {
                  return context.read<BadgeVM>().getBadges();
                },
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.02.wp,
                    mainAxisSpacing: 0.03.hp,
                  ),
                  itemCount: data.badges.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onLongPress: () async {
                        final res = await actionDialog(
                          context,
                          title: "Sure you want to delete this Badge?",
                          subtitle: "Action cannot be undone",
                        );
                        if (res) {
                          showBlockingDialog(context);

                          await context
                              .read<BadgeVM>()
                              .deleteEvent(badge: data.badges[index]);
                          context.rootNavigator.pop();
                        }
                      },
                      onTap: () {
                        context.rootNavigator.push(
                          '/badge-form-view',
                          arguments: BadgeFormViewArguments(
                            badge: data.badges[index],
                            isEditing: true,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: data.badges[index].imageUrl,
                        imageBuilder: (_, img) {
                          return CircleAvatar(
                            // backgroundImage: img,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: img, fit: BoxFit.fill),
                              ),
                            ),
                            backgroundColor: Colors.white,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            empty: (_) => Center(
              child: Text("Try adding a Badge"),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.rootNavigator.push('/badge-form-view');
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
