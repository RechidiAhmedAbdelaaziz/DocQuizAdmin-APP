import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/models/named.model.dart';
import 'package:admin_app/core/shared/widget/names_selector.dart';
import 'package:admin_app/feature/course/ui/course_selector.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:admin_app/feature/major/logic/major.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MajorSelector<T extends NamedModelBase>
    extends StatelessWidget {
  const MajorSelector(this.level, {super.key});

  final LevelModel level;

  @override
  Widget build(BuildContext context) {
    void getResultBack(T? course) => context.back(course);

    return BlocProvider(
      create: (context) => MajorCubit(level)..getMajors(),
      child: Builder(
        builder: (context) {
          final majors = context.watch<MajorCubit>().state.majors;

          return NamesSelector(
            items: majors,
            onSelect: (major) async {
              if (T == MajorModel) {
                getResultBack(major as T);
                return;
              }
              final course = await context.showBottomSheet<T>(
                child: CourseSelector(major),
              );
              if (course != null) getResultBack(course);
            },
          );
        },
      ),
    );
  }
}
