import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/questionlist/ui/questions_list.screen.dart';

class QuestionListRoute extends AbstractRoute {
  static const route = '/question-list';

  QuestionListRoute()
      : super(route, child: const QuestionsListScreen());
}

class ExamQuestionListRoute extends AbstractRoute {
  static const route = '/exam-question-list';

  ExamQuestionListRoute(ExamModel exam)
      : super(
          route,
          child: QuestionsListScreen(
            initialFilter: ListQuestionsFilter(source: exam.id),
          ),
        );
}

class FieldQuestionListRoute extends AbstractRoute {
  static const route = '/field-question-list';

  FieldQuestionListRoute(String level, String major, String course)
      : super(
          route,
          child: QuestionsListScreen(
            initialFilter: ListQuestionsFilter(fields: [
              FieldModel(
                level: level,
                major: major,
                course: course,
              ),
            ]),
          ),
        );
}
