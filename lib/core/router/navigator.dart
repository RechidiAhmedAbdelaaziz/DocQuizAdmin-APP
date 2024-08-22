import 'package:admin_app/core/router/abstract_route.dart';
import 'package:flutter/material.dart';

abstract class AppNavigator {
  set generateRoute(AbstractRoute settings) {
    settings.navigator = this;
  }

  MaterialPageRoute<D> buildRoute<D>(String path, Widget child);
}

class NormalNavigator extends AppNavigator {
  @override
  MaterialPageRoute<D> buildRoute<D>(String path, Widget child) {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => child,
    );
  }
}

// navigator that you can't pop to it when you navigate from it
class NoPopNavigator extends AppNavigator {
  @override
  MaterialPageRoute<D> buildRoute<D>(String path, Widget child) {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => PopScope(
        canPop: false,
        child: child,
      ),
    );
  }
}
