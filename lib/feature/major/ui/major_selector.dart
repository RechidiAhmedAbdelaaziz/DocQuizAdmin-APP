import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_selector.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/course/ui/course_selector.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/major/logic/major.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MajorSelector extends StatelessWidget {
  const MajorSelector(this.level, {super.key});

  final LevelModel level;

  @override
  Widget build(BuildContext context) {
    void getResultBack(CourseModel? course) => context.back(course);

    return BlocProvider(
      create: (context) => MajorCubit(level)..getMajors(),
      child: Builder(
        builder: (context) {
          final majors = context.watch<MajorCubit>().state.majors;

          return NamesSelector(
            items: majors,
            onSelect: (major) async {
              final course =
                  await context.showBottomSheet<CourseModel>(
                child: CourseSelector(major),
              );
             if (course != null)  getResultBack(course);
            },
          );
        },
      ),
    );
  }
}
