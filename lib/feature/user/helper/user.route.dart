import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/user/logic/user.cubit.dart';
import 'package:admin_app/feature/user/ui/users.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRoute extends NavigatorRouteBase {
  static const String users = 'users';

  UserRoute()
      : super(
          users,
          child: BlocProvider(
            create: (context) => UserCubit()..getUsers(),
            child: const UsersScreen(),
          ),
        );
}
