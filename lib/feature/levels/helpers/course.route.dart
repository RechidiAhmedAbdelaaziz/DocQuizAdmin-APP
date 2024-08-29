import 'package:admin_app/core/router/abstract_route.dart';

import '../view/course/course.screen.dart';

class CourseRoute extends AbstractRoute {
  static const route = '/course';

  CourseRoute(String level, String major)
      : super(route, child: CourseScreen(level, major));
}
