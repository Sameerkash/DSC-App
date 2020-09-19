import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/event.dart';
import '../../models/user.dart';
import '../../widgets/bottomSheet.dart';
import 'event.vm.dart';

class EventDetailView extends StatefulHookWidget {
  final Event event;
  final AppUser user;
  const EventDetailView({
    Key key,
    this.event,
    this.user,
  }) : super(key: key);

  @override
  _EventDetailViewState createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventVM>().setIsRegistred(widget.event);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isConfirmed = useState(false);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Color(int.tryParse(widget.event.color)),
              leading: SizedBox.shrink(),
              expandedHeight: 0.32.hp,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: AutoSizeText(
                  "${widget.event.name}",
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                ),
                background: Hero(
                  tag: widget.event.eid,
                  child: CachedNetworkImage(
                    imageUrl: widget.event.imageUrl,
                    fit: BoxFit.cover,
                  ),
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
                  height: 0.035.hp,
                ),
                Text(
                  widget.event.description,
                  // "The Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications The Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applicationsThe Explore ML tack aims to provide exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications  exposure to beginner level Machine learning applications",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 0.05.hp,
                ),
                Text(
                  DateFormat('EEE, dd MMM yy  hh:mm a')
                      .format(widget.event.time),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 0.025.hp,
                ),
                Row(
                  children: [
                    Text(
                      "${widget.event.attendees}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      " are attending this event",
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
                context.watch<EventState>().maybeMap(
                    orElse: () => CircularProgressIndicator(),
                    loaded: (data) => Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.3.wp, vertical: 0.02.hp),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Color(
                                int.tryParse(widget.event.secondaryColor)),
                            onPressed: data.events
                                    .where((e) => e.eid == widget.event.eid)
                                    .toList()[0]
                                    .isRegistered
                                ? () {}
                                : () {
                                    resgisterSheet(context,
                                        event: widget.event,
                                        isConfirmed: isConfirmed,
                                        user: widget.user);
                                  },
                            child: Text(
                              data.events
                                      .where((e) => e.eid == widget.event.eid)
                                      .toList()[0]
                                      .isRegistered
                                  ? "Confirmed"
                                  : "Register",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
