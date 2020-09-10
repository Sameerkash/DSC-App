import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/event.dart';
import '../models/user.dart';

Future<dynamic> resgisterSheet(BuildContext context,
    {Event event, AppUser user, var isConfirmed}) async {
  showModalBottomSheet(
    // isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter mystate) {
          return Container(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 0.03.hp, left: 0.06.wp, right: 0.06.wp),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isConfirmed.value)
                      Text(
                        "You are registering for",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    if (isConfirmed.value)
                      Flexible(
                        fit: FlexFit.loose,
                        child: AutoSizeText(
                          '''Please save this Code, you will require it to enter the venue''',
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          minFontSize: 17,
                          maxLines: 2,
                        ),
                      ),
                    SizedBox(
                      height: 0.05.hp,
                    ),
                    if (!isConfirmed.value) MyRegisterCard(event: event),
                    if (!isConfirmed.value)
                      SizedBox(
                        height: 0.04.hp,
                      ),
                    if (isConfirmed.value)
                      Container(
                        color: Colors.white,
                        child: CachedNetworkImage(
                          imageUrl: event.imageUrl,
                          imageBuilder: (_, img) {
                            return QrImage(
                              embeddedImage: img,
                              data: "${event.eid} ${user.uid}",
                              version: QrVersions.auto,
                              size: 0.2.hp,
                            );
                          },
                        ),
                      ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    // Spacer(),
                    Flexible(
                      child: AutoSizeText(
                        "Please register for the event only if you are sure you will be present for the full length event,so we can know in prior the exact number of attendees we need to facilitate.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.3.wp, vertical: 0.02.hp),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        onPressed: () async {
                          // showBlockingDialog(context);
                          // await context
                          //     .read<EventVM>()
                          //     .resgisterEvent(user: user, event: event);
                          // context.rootNavigator.pop();

                          mystate(() {
                            isConfirmed.value = true;
                          });
                        },
                        child: Text(
                          "Confirm",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

class MyRegisterCard extends StatelessWidget {
  final Event event;
  const MyRegisterCard({
    Key key,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(int.tryParse(event.color)),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: event.imageUrl,
          imageBuilder: (_, img) {
            return Container(
              height: 0.05.hp,
              width: 0.1.wp,
              decoration: BoxDecoration(
                image: DecorationImage(image: img, fit: BoxFit.contain),
              ),
            );
          },
        ),
        title: AutoSizeText(
          event.name,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 2,
        ),
      ),
    );
  }
}
