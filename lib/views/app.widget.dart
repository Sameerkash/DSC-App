import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'auth/auth.view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        ScreenUtil.init(context,
            allowFontScaling: true, width: size.width, height: size.height);
        return AutView();
      },
    );
  }
}
