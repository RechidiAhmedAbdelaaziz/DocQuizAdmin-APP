import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/logic/question.cubit.dart';
import 'package:admin_app/feature/question/module/question/ui/question.screen.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:admin_app/feature/question/module/questionlist/ui/questions_list.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionRoute extends NavigatorRouteBase<QuestionModel> {
  static const route = '/question';

  QuestionRoute.create()
      : super(
          route,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => QuestionCubit()),
            ],
            child: const QuestionScreen(),
          ),
        );

  QuestionRoute.edit(QuestionModel question)
      : super(
          route,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => QuestionCubit(question: question)),
            ],
            child: const QuestionScreen(),
          ),
        );
}

class QuestionListRoute extends NavigatorRouteBase {
  static const route = '/questions';

  QuestionListRoute()
      : super(
          route,
          child: BlocProvider(
            create: (_) => QuestionListCubit()..fetchQuestions(),
            child: const QuestionsListScreen(),
          ),
        );
}
