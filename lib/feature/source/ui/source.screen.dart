import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_list.dart';
import 'package:admin_app/feature/question/helper/question.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/source.cubit.dart';

class SourceScreen extends StatelessWidget {
  const SourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SourceCubit>();
    return NamesList(
      title: 'Sources',
      items: cubit.state.sources,
      onAdd: cubit.addSource,
      onEdit: cubit.updateSource,
      onDelete: cubit.deleteSource,
      onTap: (source) =>
          context.to(QuestionListRoute.ofSource(source)),
    );
  }
}
