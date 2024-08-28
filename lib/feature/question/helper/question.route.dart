import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/question/module/questionlist/ui/questions_list.screen.dart';

class QuestionListRoute extends AbstractRoute {
  static const route = '/question-list';

  QuestionListRoute() : super(route, child: QuestionsListScreen());
}
