import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:admin_app/feature/course/logic/course.cubit.dart';
import 'package:admin_app/feature/course/ui/courses.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseRoute extends NavigatorRouteBase {
  static const route = '/course';

  CourseRoute.major(MajorModel major)
      : super(
          route,
          child: BlocProvider(
            create: (context) => CourseCubit(major)..getCourses(),
            child: const CoursesScreen(),
          ),
        );
}
