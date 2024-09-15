import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/feature/auth/helpers/login.router.dart';
import 'package:admin_app/feature/auth/logic/auth.cubit.dart';
import 'package:admin_app/feature/home/helper/home.route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthListener extends StatelessWidget {
  const AuthListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: locator<AuthCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () {
            context.backToRoot();
            context.to(LoginRoute(), canPop: false);
          },
          sessionExpired: () {
            context.to(LoginRoute(), canPop: false);
            context.showDialogBox(
              title: 'Session Expired',
              confirmText: 'Login Again',
              onConfirm: (back) => back(),
            );
          },
          authenticated: () {
            context.to(HomeRoute(), canPop: false);
          },
        );
      },
      child: const Scaffold(),
    );
  }
}
