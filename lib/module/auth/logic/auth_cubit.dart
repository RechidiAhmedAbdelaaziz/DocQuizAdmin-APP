import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/models/api_error.model.dart';
import 'package:admin_app/module/auth/domain/usecases/login.usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _login;

  AuthCubit()
      : _login = locator(),
        super(const AuthState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(const AuthState.loginInProgress());

    final email = emailController.text;
    final password = passwordController.text;

    final result = await _login.call(email, password);

    result.when(
      success: (data) {
        emit(const AuthState.loginSuccess());
      },
      failure: (error) {
        emit(AuthState.loginFailure(error));
      },
    );
  }
}
