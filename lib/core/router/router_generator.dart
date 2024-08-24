import 'package:admin_app/core/router/abstract_route.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();
  Route<T> generateRoute<T>(RouteSettings settings) {
    final route = settings.arguments as AbstractRoute<T>;
    return route.buildRoute();
  }
}
