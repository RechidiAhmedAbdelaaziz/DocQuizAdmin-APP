import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/major/logic/major.cubit.dart';
import 'package:admin_app/feature/major/ui/majors.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MajorRoute extends NavigatorRouteBase {
  static const route = '/major';

  MajorRoute.level(LevelModel level)
      : super(
          route,
          child: BlocProvider(
            create: (context) => MajorCubit(level)..getMajors(),
            child: const MajorsScreen(),
          ),
        );
}
