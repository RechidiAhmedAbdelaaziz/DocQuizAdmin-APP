import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/home/view/home.screen.dart';

class HomeRoute extends AbstractRoute {
  static const String route = '/home';

  HomeRoute() : super(route, child: const HomeScreen());
}
