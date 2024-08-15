import 'package:admin_app/core/router/router_generator.dart';
import 'package:flutter/material.dart';

import 'module/login/view/index.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key, required AppRouter router})
      : _router = router;

  final AppRouter _router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: _router.generateRoute,
      initialRoute: LoginScreen.route,
    );
  }
}
