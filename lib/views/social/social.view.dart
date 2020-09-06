import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 0.05.hp, left: 0.05.wp, bottom: 0.05.hp),
                child: Text("Updates",
                    style: Theme.of(context).textTheme.headline1),
              ),
              Card(
                color: Colors.grey[800],
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/color_icon.png"),
                        ),
                        title: Text("DSC KSSEM",
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                      ),
                      Text(
                        "Welcome to DSC KSSEM, where you will get to enjoy amazing technolgies and solve gread problems while colloboarating",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 0.015.hp,
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 0.015.hp,
                      ),
                      Container(
                        height: 0.45.hp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 0.01.hp,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 17,
                            ),
                            SizedBox(
                              width: 0.02.wp,
                            ),
                            Text(
                              "45 people like this",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
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
