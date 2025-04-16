import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_list.dart';
import 'package:admin_app/feature/question/helper/question.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/course.cubit.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CourseCubit>();
    return NamesList(
      title: "Les cours de ${cubit.major.name}",
      items: cubit.state.courses,
      onAdd: (name, [isOpen]) =>
          cubit.addCourse(name, isOpen ?? false),
      onEdit: (p0, name, [isOpen]) =>
          cubit.updateCourse(p0, name, isOpen ?? false),
      onDelete: cubit.deleteCourse,
      onTap: (course) =>
          context.to(QuestionListRoute.ofCourse(course)),
    );
  }
}
