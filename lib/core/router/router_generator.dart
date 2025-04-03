import 'package:admin_app/core/router/abstract_route.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();
  Route generateRoute(RouteSettings settings) {
    final route = settings.arguments as NavigatorRouteBase;
    return route.buildRoute();
  }
}
