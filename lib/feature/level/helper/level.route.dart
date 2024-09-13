import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/level/logic/level.cubit.dart';
import 'package:admin_app/feature/level/ui/levels.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelRoute extends NavigatorRouteBase {
  static const route = '/level';

  LevelRoute.domain(DomainModel domain)
      : super(
          route,
          child: BlocProvider(
            create: (context) => LevelCubit(domain)..getLevels(),
            child: const LevelsScreen(),
          ),
        );
}
