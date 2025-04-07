import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_list.dart';
import 'package:admin_app/feature/major/helper/major.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/level.cubit.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LevelCubit>();
    return NamesList(
      title: "Les niveaux de ${cubit.domain.name}",
      items: cubit.state.levels,
      onAdd: (name, [isOpen]) => cubit.addLevel(name),
      onEdit: (level, name, [isOpen]) =>
          cubit.updateLevel(level, name),
      onDelete: cubit.deleteLevel,
      onTap: (level) => context.to(MajorRoute.level(level)),
    );
  }
}
