part of 'auth.cubit.dart';

@freezed
class AuthState with _$AuthState {

  const factory AuthState.initial() = _Initial;

  const factory AuthState.checkingAuth() = _CheckingAuth;
  
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated() = _Authenticated;

  const factory AuthState.sessionExpired( ) = _SessionExpired;
  const factory AuthState.sessionRefreshed() = _SessionRefreshed;

  const factory AuthState.loggingOut() = _LoggingOut;


  
}
