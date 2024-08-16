import 'package:admin_app/core/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'module/auth/view/login.screen.dart';

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
        home: LoginScreen(),
        onGenerateRoute: _router.generateRoute,
      ),
    );
  }
}
