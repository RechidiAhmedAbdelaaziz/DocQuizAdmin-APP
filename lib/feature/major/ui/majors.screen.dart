import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_list.dart';
import 'package:admin_app/feature/course/helper/course.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/major.cubit.dart';

class MajorsScreen extends StatelessWidget {
  const MajorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MajorCubit>();
    return NamesList(
      title: "Les modules de ${cubit.level.name}",
      items: cubit.state.majors,
      onAdd: (name, [isOpen]) =>
          cubit.addMajor(name, isOpen ?? false),
      onEdit: (p0, name, [isOpen]) =>
          cubit.updateMajor(p0, name, isOpen ?? false),
      onDelete: cubit.deleteMajor,
      onTap: (major) => context.to(CourseRoute.major(major)),
    );
  }
}
