// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckingAuthImplCopyWith<$Res> {
  factory _$$CheckingAuthImplCopyWith(
          _$CheckingAuthImpl value, $Res Function(_$CheckingAuthImpl) then) =
      __$$CheckingAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingAuthImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$CheckingAuthImpl>
    implements _$$CheckingAuthImplCopyWith<$Res> {
  __$$CheckingAuthImplCopyWithImpl(
      _$CheckingAuthImpl _value, $Res Function(_$CheckingAuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckingAuthImpl implements _CheckingAuth {
  const _$CheckingAuthImpl();

  @override
  String toString() {
    return 'AuthState.checkingAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckingAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return checkingAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return checkingAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (checkingAuth != null) {
      return checkingAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return checkingAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return checkingAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (checkingAuth != null) {
      return checkingAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckingAuth implements AuthState {
  const factory _CheckingAuth() = _$CheckingAuthImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated() = _$AuthenticatedImpl;
}

/// @nodoc
abstract class _$$SessionExpiredImplCopyWith<$Res> {
  factory _$$SessionExpiredImplCopyWith(_$SessionExpiredImpl value,
          $Res Function(_$SessionExpiredImpl) then) =
      __$$SessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionExpiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SessionExpiredImpl>
    implements _$$SessionExpiredImplCopyWith<$Res> {
  __$$SessionExpiredImplCopyWithImpl(
      _$SessionExpiredImpl _value, $Res Function(_$SessionExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionExpiredImpl implements _SessionExpired {
  const _$SessionExpiredImpl();

  @override
  String toString() {
    return 'AuthState.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class _SessionExpired implements AuthState {
  const factory _SessionExpired() = _$SessionExpiredImpl;
}

/// @nodoc
abstract class _$$SessionRefreshedImplCopyWith<$Res> {
  factory _$$SessionRefreshedImplCopyWith(_$SessionRefreshedImpl value,
          $Res Function(_$SessionRefreshedImpl) then) =
      __$$SessionRefreshedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionRefreshedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SessionRefreshedImpl>
    implements _$$SessionRefreshedImplCopyWith<$Res> {
  __$$SessionRefreshedImplCopyWithImpl(_$SessionRefreshedImpl _value,
      $Res Function(_$SessionRefreshedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionRefreshedImpl implements _SessionRefreshed {
  const _$SessionRefreshedImpl();

  @override
  String toString() {
    return 'AuthState.sessionRefreshed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionRefreshedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return sessionRefreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return sessionRefreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (sessionRefreshed != null) {
      return sessionRefreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return sessionRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return sessionRefreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (sessionRefreshed != null) {
      return sessionRefreshed(this);
    }
    return orElse();
  }
}

abstract class _SessionRefreshed implements AuthState {
  const factory _SessionRefreshed() = _$SessionRefreshedImpl;
}

/// @nodoc
abstract class _$$LoggingOutImplCopyWith<$Res> {
  factory _$$LoggingOutImplCopyWith(
          _$LoggingOutImpl value, $Res Function(_$LoggingOutImpl) then) =
      __$$LoggingOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggingOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoggingOutImpl>
    implements _$$LoggingOutImplCopyWith<$Res> {
  __$$LoggingOutImplCopyWithImpl(
      _$LoggingOutImpl _value, $Res Function(_$LoggingOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoggingOutImpl implements _LoggingOut {
  const _$LoggingOutImpl();

  @override
  String toString() {
    return 'AuthState.loggingOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggingOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuth,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() sessionExpired,
    required TResult Function() sessionRefreshed,
    required TResult Function() loggingOut,
  }) {
    return loggingOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuth,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticated,
    TResult? Function()? sessionExpired,
    TResult? Function()? sessionRefreshed,
    TResult? Function()? loggingOut,
  }) {
    return loggingOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuth,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? sessionExpired,
    TResult Function()? sessionRefreshed,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingOut != null) {
      return loggingOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuth value) checkingAuth,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_SessionRefreshed value) sessionRefreshed,
    required TResult Function(_LoggingOut value) loggingOut,
  }) {
    return loggingOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuth value)? checkingAuth,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_SessionRefreshed value)? sessionRefreshed,
    TResult? Function(_LoggingOut value)? loggingOut,
  }) {
    return loggingOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuth value)? checkingAuth,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_SessionRefreshed value)? sessionRefreshed,
    TResult Function(_LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingOut != null) {
      return loggingOut(this);
    }
    return orElse();
  }
}

abstract class _LoggingOut implements AuthState {
  const factory _LoggingOut() = _$LoggingOutImpl;
}
