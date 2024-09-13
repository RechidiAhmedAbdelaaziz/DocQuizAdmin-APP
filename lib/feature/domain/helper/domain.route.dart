import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/domain/logic/domain.cubit.dart';
import 'package:admin_app/feature/domain/ui/domains.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DomainRoute extends NavigatorRouteBase {
  static const route = '/domain';

  DomainRoute()
      : super(route,
            child: BlocProvider(
              create: (context) => DomainCubit()..getDomains(),
              child: const DomainsScreen(),
            ));
}
