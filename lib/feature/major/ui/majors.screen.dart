import 'package:admin_app/core/shared/widget/names_list.dart';
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
      onAdd: cubit.addMajor,
      onEdit: cubit.updateMajor,
      onDelete: cubit.deleteMajor,
    );
  }
}
