part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loginInProgress() = _LoginInProgress;
  const factory AuthState.loginSuccess() = _LoginSuccess;

  const factory AuthState.loginFailure(ApiErrorModel error) =
      _LoginFailure;
}
