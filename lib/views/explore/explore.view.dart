import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {
  _launchURL(BuildContext context) async {
    try {
      await launch(
        'https://dsc.community.dev/k-s-school-of-engineering-and-management/',
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
        children: [
          Card(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 0.1.hp,
              child: Center(
                child: Text('YouTube',
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _launchURL(context);
            },
            child: Card(
              color: Colors.white70,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 0.1.hp,
                child: Center(
                  child: Text('DSC KSSEM',
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
