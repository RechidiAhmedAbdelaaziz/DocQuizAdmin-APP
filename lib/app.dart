import 'package:admin_app/core/router/router_generator.dart';
import 'package:admin_app/core/theme/colors.dart';
import 'package:admin_app/core/utils/auth_listener.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key, required AppRouter router})
      : _router = router;

  final AppRouter _router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.silver,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home: const AuthListener(),
        onGenerateRoute: _router.generateRoute,
      ),
    );
  }
}
