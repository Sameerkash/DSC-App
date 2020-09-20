import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.02.wp,
                  mainAxisSpacing: 0.03.hp,
                ),
                itemCount: data.badges.length,
                itemBuilder: (_, index) {
                  return CachedNetworkImage(
                    imageUrl: data.badges[index].imageUrl,
                    imageBuilder: (_, img) {
                      return CircleAvatar(
                        // backgroundImage: img,
                        child: Container(
                          decoration: BoxDecoration(
                            image:
                                DecorationImage(image: img, fit: BoxFit.fill),
                          ),
                        ),
                        backgroundColor: Colors.white,
                      );
                    },
                  );
                },
              ),
            ),
            empty: (_) => Center(
              child: Text("Try adding a Badge"),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // context.rootNavigator.push('/event-form');
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
