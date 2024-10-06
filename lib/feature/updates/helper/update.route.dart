import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/updates/data/model/updates.model.dart';
import 'package:admin_app/feature/updates/logic/updtes.cubit.dart';
import 'package:admin_app/feature/updates/ui/create_updates.dart';
import 'package:admin_app/feature/updates/ui/updates.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatesRoute extends NavigatorRouteBase<UpdatesModel> {
  static const listRoute = 'updates';
  static const createRoute = 'updates/create';
  static const updateRoute = 'updates/update';

  UpdatesRoute()
      : super(
          listRoute,
          child: BlocProvider(
            create: (_) => UpdatesCubit()..fetchUpdates(),
            child: const UpdatesScreen(),
          ),
        );

  UpdatesRoute.create(UpdatesCubit cubit)
      : super(createRoute,
            child: BlocProvider.value(
              value: cubit,
              child: CreateUpdates(),
            ));

  UpdatesRoute.update(UpdatesModel update, UpdatesCubit cubit)
      : super(updateRoute,
            child: BlocProvider.value(
              value: cubit,
              child: CreateUpdates(update: update),
            ));
}
