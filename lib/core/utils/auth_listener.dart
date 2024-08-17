import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/module/auth/helpers/login.router.dart';
import 'package:admin_app/module/auth/logic/auth.cubit.dart';
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
            context.offAll(LoginRoute());
          },
          sessionExpired: () => context.showAlertDialog(
            title: 'Session Expired',
            cancelText: 'Logout',
            onCancel: () => locator<AuthCubit>().onLogout(),
            canPop: false,
          ),
          authenticated: () {
            context.offAll(LoginRoute());//TODO change to HomeRoute
          },
        );
      },
      child: const Scaffold(),
    );
  }
}
