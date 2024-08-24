import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/module/exam/view/exam/exam.screen.dart';

class ExamRoute extends AbstractRoute {
  static const route = '/exam';

  ExamRoute() : super(route, child: const ExamScreen());
}
