import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'auth.vm.dart';

class AutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil.screenHeight;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: height < 600 ? 0.02.hp : 0.07.hp, left: 5, right: 5),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0.35.hp,
                width: 0.8.wp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/color_icon.png"),
                  ),
                ),
              ),
              Container(
                height: 0.1.hp,
                child: Column(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Developer Students Club",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                    ),
                    SizedBox(
                      height: 0.01.hp,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "KS School of Engineering and Management", /// Change to your chapter name
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[300]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height < 600 ? 0.2.hp : 0.17.hp,
              ),
              FlatButton.icon(
                padding: EdgeInsets.symmetric(
                    horizontal: height < 600 ? 0.08.wp : 0.12.wp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                icon: Icon(
                  MaterialCommunityIcons.google,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.read<AuthVM>().googleSignIn();
                },
                label: Text(
                  "SignIn with Google",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
