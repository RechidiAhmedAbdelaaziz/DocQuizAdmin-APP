import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/exam/data/models/create_exam.param.dart';

import '../data/models/exam.model.dart';
import '../view/createexam/create_exam.screen.dart';

class CreateExamRoute extends NavigatorRouteBase<CreateExamParam> {
  static const route = '/create-exam';

  CreateExamRoute({ExamModel? exam})
      : super(route, child: CreateExamScreen(exam: exam));
}
