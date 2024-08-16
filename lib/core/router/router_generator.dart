import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/module/auth/view/login.screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();
  Route<T> generateRoute<T>(RouteSettings settings) {
    if (settings.arguments is AbstractRoute) {
      final route = settings.arguments as AbstractRoute;
      return route.buildRoute();
    }

    return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}
