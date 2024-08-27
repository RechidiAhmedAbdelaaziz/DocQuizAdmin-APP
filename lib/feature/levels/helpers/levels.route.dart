import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/levels/view/level/level.screen.dart';

class LevelRoute extends AbstractRoute {
  static const route = '/levels';

  LevelRoute() : super(route, child: const LevelScreen());
}
