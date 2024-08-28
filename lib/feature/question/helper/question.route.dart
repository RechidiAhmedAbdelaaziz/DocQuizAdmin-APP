import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/ui/question.screen.dart';

class CreateQuestionRoute extends AbstractRoute {
  static const route = '/create-question';

  CreateQuestionRoute()
      : super(
          route,
          child: const QuestionScreen(),
        );
}

class UpdateQuestionRoute extends AbstractRoute {
  static const route = '/update-question';

  UpdateQuestionRoute(QuestionModel question)
      : super(
          route,
          child: QuestionScreen(question: question),
        );
}
