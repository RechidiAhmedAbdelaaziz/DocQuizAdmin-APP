import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/module/auth/helpers/login.router.dart';
import 'package:admin_app/module/auth/logic/auth.cubit.dart';
import 'package:admin_app/module/levels/helpers/levels.route.dart';
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
            context.to(LoginRoute(), canPop: false);
          },
          sessionExpired: () {
            context.backToRoot();
            context.showAlertDialog(
              title: 'Session Expired',
              cancelText: 'Logout',
              onCancel: (_) => locator<AuthCubit>().onLogout(),
              canPop: false,
            );
          },
          authenticated: () {
            context.to(LevelRoute(), canPop: false);
          },
        );
      },
      child: const Scaffold(),
    );
  }
}