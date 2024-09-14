import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/logic/question.cubit.dart';
import 'package:admin_app/feature/question/module/question/ui/question.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionRoute extends NavigatorRouteBase {
  static const route = '/question';

  QuestionRoute.create()
      : super(
          route,
          child: BlocProvider(
            create: (_) => QuestionCubit(),
            child: const QuestionScreen(),
          ),
        );

  QuestionRoute.update(QuestionModel question)
      : super(
          route,
          child: BlocProvider(
            create: (_) => QuestionCubit(question: question),
            child: const QuestionScreen(),
          ),
        );
}
