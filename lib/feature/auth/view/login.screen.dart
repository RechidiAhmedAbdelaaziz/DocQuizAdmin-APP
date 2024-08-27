import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:admin_app/core/shared/widget/inpute_field.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/core/theme/colors.dart';
import 'package:admin_app/feature/auth/logic/login.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'scaffold.dart';
part 'form.dart';
part 'login_button.dart';
part 'logo.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/login';
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: _Scaffold(
        logo: const _Logo(),
        form: _Form(_formKey),
        loginButton: _LoginButton(_formKey),
        listener: (context, state) {
          state.whenOrNull(
            loginFailure: (error) =>
                context.showErrorSnackBar(error.message),
            loginSuccess: () =>
                context.showSuccessSnackBar('Login Success'),
          );
        },
      ),
    );
  }
}
