import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {
  static const String chapterUrl =
      'https://dsc.community.dev/k-s-school-of-engineering-and-management/';
  static const String youtubeUrl =
      'https://www.youtube.com/channel/UCOFKlS2F_j1TUkoG6xSVY_w';

  _launchURL(BuildContext context, String url) async {
    try {
      await launch(
        url,
        option: CustomTabsOption(
          enableInstantApps: true,
          toolbarColor: Colors.black,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.02.hp, left: 0.05.wp),
            child:
                Text("Explore", style: Theme.of(context).textTheme.headline1),
          ),
          SizedBox(
            width: 0.05.wp,
          ),
          ExploreCard(
            title: "Youtube",
            color: Colors.red,
            onTap: () {
              _launchURL(context, youtubeUrl);
            },
          ),
          ExploreCard(
            title: "DSC KSSEM",
            color: Colors.white70,
            onTap: () {
              _launchURL(context, chapterUrl);
            },
          )
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ExploreCard extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;
  const ExploreCard({
    Key key,
    this.title,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 0.1.hp,
          child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline1),
          ),
        ),
      ),
    );
  }
}

//  Builder(
//           builder: (BuildContext context) {
//             return WebView(
//               initialUrl:
//                   'https://dsc.community.dev/k-s-school-of-engineering-and-management/',
//               javascriptMode: JavascriptMode.unrestricted,
//               onWebViewCreated: (WebViewController webViewController) {
//                 // _controller.complete(webViewController);
//               },
//               // ignore: prefer_collection_literals
//               javascriptChannels: <JavascriptChannel>[].toSet(),
//               navigationDelegate: (NavigationRequest request) {
//                 if (request.url
//                     .startsWith('https://accounts.google.com/o/oauth2')) {
//                   print('blocking navigation to ${request.url}');
//                   _launchURL("${request.url}");
//                   return NavigationDecision.prevent;
//                 }
//                 // print('allowing navigation to $request');
//                 return NavigationDecision.navigate;
//               },
//               onPageStarted: (String url) {
//                 // print('Page started loading: $url');
//               },
//               onPageFinished: (String url) {
//                 // print('Page finished loading: $url');
//               },
//               gestureNavigationEnabled: true,
//             );
//           },
//         ),
