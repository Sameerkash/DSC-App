import 'package:dsckssem/views/navbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        ScreenUtil.init(context,
            allowFontScaling: true, width: size.width, height: size.height);
        return NavBarPage();
      },
    );
  }
}
