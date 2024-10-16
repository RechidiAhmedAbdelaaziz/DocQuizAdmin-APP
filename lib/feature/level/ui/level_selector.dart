import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_selector.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/major/ui/major_selector.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/level/logic/level.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector(this.domain, {super.key});

  final DomainModel domain;

  @override
  Widget build(BuildContext context) {
    void getResultBack(CourseModel? major) => context.back(major);

    return BlocProvider(
      create: (context) => LevelCubit(domain)..getLevels(),
      child: Builder(
        builder: (context) {
          final levels = context.watch<LevelCubit>().state.levels;

          return NamesSelector(
            items: levels,
            onSelect: (level) async {
              final course =
                  await context.showBottomSheet<CourseModel>(
                child: MajorSelector(level),
              );
              if (course != null) getResultBack(course);
            },
          );
        },
      ),
    );
  }
}
