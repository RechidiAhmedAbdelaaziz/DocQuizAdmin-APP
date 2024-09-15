import 'package:admin_app/core/shared/widget/names_selector.dart';
import 'package:admin_app/feature/course/logic/course.cubit.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseSelector extends StatelessWidget {
  const CourseSelector(this.major, {super.key});

  final MajorModel major;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit(major)..getCourses(),
      child: Builder(builder: (context) {
        final courses = context.watch<CourseCubit>().state.courses;
        return NamesSelector(items: courses);
      }),
    );
  }
}
