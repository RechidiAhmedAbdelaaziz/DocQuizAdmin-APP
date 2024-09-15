import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:admin_app/core/helpers/dio.helper.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:admin_app/feature/auth/data/repo/auth.repo.dart';
import 'package:admin_app/feature/auth/data/source/auth.cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.state.dart';
part 'auth.cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authRepository = locator<AuthRepository>();
  final _authCacheHelper = locator<AuthCacheHelper>();

  AuthCubit() : super(const AuthState.initial());

  Future<void> checkAuth() async {
    emit(const AuthState.checkingAuth());
    final accessToken = await _authCacheHelper.accessToken;

    accessToken.isNotEmptyOrNull
        ? _emitAuthenticated()
        : _emitUnauthenticated();
  }

  Future<void> onLogin(ApiResponseModelTMP data) async {
    final tokens = data.tokens!;

    await _authCacheHelper.setTokens(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );

    _emitAuthenticated();
  }

  Future<void> onRefreshToken(String refreshToken) async {
    final result = await _authRepository.refreshToken(refreshToken);

    result.whenOrNull(
      success: (data) async {
        final newAccessToken = data.tokens?.accessToken ?? '';
        final newRefreshToken = data.tokens?.refreshToken ?? '';

        await _authCacheHelper.setTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        emit(const AuthState.sessionRefreshed());
      },
      failure: (error) async {
        await onLogout();
        emit(const AuthState.sessionExpired());
      },
    );
  }

  Future<void> onLogout() async {
    DioHelper.removeTokenInterceptor();
    await _authCacheHelper.clearTokens();
  }

  void _emitAuthenticated() {
    DioHelper.addTokenInterceptor();
    emit(const AuthState.authenticated());
  }

  void _emitUnauthenticated() {
    DioHelper.removeTokenInterceptor();
    emit(const AuthState.unauthenticated());
  }
}
