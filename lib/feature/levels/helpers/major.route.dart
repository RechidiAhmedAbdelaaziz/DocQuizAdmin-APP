import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/levels/view/major/major.screen.dart';

class MajorRoute extends NavigatorRouteBase {
  static const route = '/levels/:level/majors';

  MajorRoute(String level) : super(route, child: MajorScreen(level));
}
