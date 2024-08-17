part of 'login.cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loginInProgress() = _LoginInProgress;
  const factory LoginState.loginSuccess() = _LoginSuccess;

  const factory LoginState.loginFailure(ApiErrorModel error) =
      _LoginFailure;
}
