import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/screen/question.screen.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateQuestionRoute extends AbstractRoute {
  static const route = '/create-question';

  CreateQuestionRoute({
    required QuestionListCubit questionListCubit,
  }) : super(
          route,
          child: BlocProvider.value(
            value: questionListCubit,
            child: QuestionScreen(),
          ),
        );
}

class UpdateQuestionRoute extends AbstractRoute {
  static const route = '/update-question';

  UpdateQuestionRoute(
    QuestionModel question, {
    required QuestionListCubit questionListCubit,
  }) : super(
          route,
          child: BlocProvider.value(
            value: questionListCubit,
            child: QuestionScreen(question: question),
          ),
        );
}
