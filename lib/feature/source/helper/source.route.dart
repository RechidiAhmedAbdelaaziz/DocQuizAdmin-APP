import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/source/logic/source.cubit.dart';
import 'package:admin_app/feature/source/ui/source.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourceRoute extends NavigatorRouteBase {
  static const route = '/source';

  SourceRoute()
      : super(route,
            child: BlocProvider(
              create: (_) => SourceCubit()..getSources(),
              child: const SourceScreen(),
            ));
}
