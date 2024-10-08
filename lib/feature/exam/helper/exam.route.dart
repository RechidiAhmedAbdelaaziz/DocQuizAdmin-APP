import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/exam/view/exam/exam.screen.dart';

class ExamRoute extends NavigatorRouteBase {
  static const route = '/exam';

  ExamRoute() : super(route, child: const ExamScreen());
}
