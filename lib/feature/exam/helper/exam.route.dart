import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/exam/logic/exam.cubit.dart';
import 'package:admin_app/feature/exam/view/exams/exams.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamRoute extends NavigatorRouteBase {
  static const route = '/exam';

  ExamRoute()
      : super(
          route,
          child: BlocProvider(
            create: (context) => ExamCubit()..fetchExams(),
            child: const ExamScreen(),
          ),
        );
}
