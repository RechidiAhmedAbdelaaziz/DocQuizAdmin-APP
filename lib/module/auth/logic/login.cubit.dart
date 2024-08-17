import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/models/api_error.model.dart';
import 'package:admin_app/module/auth/domain/usecases/login.usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.state.dart';
part 'login.cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _login;

  LoginCubit()
      : _login = locator(),
        super(const LoginState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(const LoginState.loginInProgress());

    final email = emailController.text;
    final password = passwordController.text;

    final result = await _login.call(email, password);

    result.when(
      success: (data) {
        emit(const LoginState.loginSuccess());
      },
      failure: (error) {
        emit(LoginState.loginFailure(error));
      },
    );
  }
}
