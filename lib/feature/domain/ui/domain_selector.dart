import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_selector.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/domain/logic/domain.cubit.dart';
import 'package:admin_app/feature/level/ui/level_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DomainSelector extends StatelessWidget {
  const DomainSelector({super.key});

  @override
  Widget build(BuildContext context) {
    void getResultBack(CourseModel? course) => context.back(course);

    return BlocProvider(
      create: (context) => DomainCubit()..getDomains(),
      child: Builder(
        builder: (context) {
          final domains = context.watch<DomainCubit>().state.domains;

          return NamesSelector(
            items: domains,
            onSelect: (domain) async {
              final course =
                  await context.showBottomSheet<CourseModel>(
                child: LevelSelector(domain),
              );
              if (course != null) getResultBack(course);
            },
          );
        },
      ),
    );
  }
}
