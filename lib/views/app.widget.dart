import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

import 'auth/auth.view.dart';
import 'auth/auth.vm.dart';
import 'navbar.widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        ScreenUtil.init(context,
            allowFontScaling: true, width: size.width, height: size.height);
        return context.watch<AuthState>().map(
              loading: (_) => Center(child: CircularProgressIndicator()),
              authenticated: (data) => NavBarPage(
                isAdmin: data.user?.isAdmin,
              ),
              unauthenticated: (_) => AutView(),
            );
      },
    );
  }
}
