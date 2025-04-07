import 'package:admin_app/core/shared/widget/names_selector.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:admin_app/feature/source/logic/source.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourceSelector extends StatelessWidget {
  final void Function(SourceModel source)? onSelect;
  const SourceSelector({super.key, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourceCubit()..getSources(),
      child: Builder(
        builder: (context) {
          final sources = context.watch<SourceCubit>().state.sources;
          return NamesSelector(
            items: sources,
            onSelect: onSelect,
          );
        },
      ),
    );
  }
}
