import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/names_list.dart';
import 'package:admin_app/feature/domain/logic/domain.cubit.dart';
import 'package:admin_app/feature/level/helper/level.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DomainsScreen extends StatelessWidget {
  const DomainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DomainCubit>();
    final domains = context.watch<DomainCubit>().state.domains;
    return NamesList(
      title: 'Les domaines',
      items: domains,
      onDelete: cubit.deleteDomain,
      onAdd: (name, [isOpen]) => cubit.addDomain(name),
      onEdit: (domain, name, [isOpen]) =>
          cubit.updateDomain(domain, name),
      onTap: (domain) => context.to(LevelRoute.domain(domain)),
    );
  }
}
