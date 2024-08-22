// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LevelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelStateCopyWith<$Res> {
  factory $LevelStateCopyWith(
          LevelState value, $Res Function(LevelState) then) =
      _$LevelStateCopyWithImpl<$Res, LevelState>;
}

/// @nodoc
class _$LevelStateCopyWithImpl<$Res, $Val extends LevelState>
    implements $LevelStateCopyWith<$Res> {
  _$LevelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LevelState
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
    extends _$LevelStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LevelState.initial()';
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
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
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
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LevelState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FetchingLevelsImplCopyWith<$Res> {
  factory _$$FetchingLevelsImplCopyWith(_$FetchingLevelsImpl value,
          $Res Function(_$FetchingLevelsImpl) then) =
      __$$FetchingLevelsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchingLevelsImplCopyWithImpl<$Res>
    extends _$LevelStateCopyWithImpl<$Res, _$FetchingLevelsImpl>
    implements _$$FetchingLevelsImplCopyWith<$Res> {
  __$$FetchingLevelsImplCopyWithImpl(
      _$FetchingLevelsImpl _value, $Res Function(_$FetchingLevelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchingLevelsImpl implements _FetchingLevels {
  const _$FetchingLevelsImpl();

  @override
  String toString() {
    return 'LevelState.fetchingLevels()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchingLevelsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) {
    return fetchingLevels();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) {
    return fetchingLevels?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
    required TResult orElse(),
  }) {
    if (fetchingLevels != null) {
      return fetchingLevels();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) {
    return fetchingLevels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) {
    return fetchingLevels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) {
    if (fetchingLevels != null) {
      return fetchingLevels(this);
    }
    return orElse();
  }
}

abstract class _FetchingLevels implements LevelState {
  const factory _FetchingLevels() = _$FetchingLevelsImpl;
}

/// @nodoc
abstract class _$$LevelsFetchedImplCopyWith<$Res> {
  factory _$$LevelsFetchedImplCopyWith(
          _$LevelsFetchedImpl value, $Res Function(_$LevelsFetchedImpl) then) =
      __$$LevelsFetchedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LevelsFetchedImplCopyWithImpl<$Res>
    extends _$LevelStateCopyWithImpl<$Res, _$LevelsFetchedImpl>
    implements _$$LevelsFetchedImplCopyWith<$Res> {
  __$$LevelsFetchedImplCopyWithImpl(
      _$LevelsFetchedImpl _value, $Res Function(_$LevelsFetchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LevelsFetchedImpl implements _LevelsFetched {
  const _$LevelsFetchedImpl();

  @override
  String toString() {
    return 'LevelState.levelsFetched()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LevelsFetchedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) {
    return levelsFetched();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) {
    return levelsFetched?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
    required TResult orElse(),
  }) {
    if (levelsFetched != null) {
      return levelsFetched();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) {
    return levelsFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) {
    return levelsFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) {
    if (levelsFetched != null) {
      return levelsFetched(this);
    }
    return orElse();
  }
}

abstract class _LevelsFetched implements LevelState {
  const factory _LevelsFetched() = _$LevelsFetchedImpl;
}

/// @nodoc
abstract class _$$CreatingLevelImplCopyWith<$Res> {
  factory _$$CreatingLevelImplCopyWith(
          _$CreatingLevelImpl value, $Res Function(_$CreatingLevelImpl) then) =
      __$$CreatingLevelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingLevelImplCopyWithImpl<$Res>
    extends _$LevelStateCopyWithImpl<$Res, _$CreatingLevelImpl>
    implements _$$CreatingLevelImplCopyWith<$Res> {
  __$$CreatingLevelImplCopyWithImpl(
      _$CreatingLevelImpl _value, $Res Function(_$CreatingLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatingLevelImpl implements _CreatingLevel {
  const _$CreatingLevelImpl();

  @override
  String toString() {
    return 'LevelState.creatingLevel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingLevelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) {
    return creatingLevel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) {
    return creatingLevel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
    required TResult orElse(),
  }) {
    if (creatingLevel != null) {
      return creatingLevel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) {
    return creatingLevel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) {
    return creatingLevel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) {
    if (creatingLevel != null) {
      return creatingLevel(this);
    }
    return orElse();
  }
}

abstract class _CreatingLevel implements LevelState {
  const factory _CreatingLevel() = _$CreatingLevelImpl;
}

/// @nodoc
abstract class _$$LevelCreatedImplCopyWith<$Res> {
  factory _$$LevelCreatedImplCopyWith(
          _$LevelCreatedImpl value, $Res Function(_$LevelCreatedImpl) then) =
      __$$LevelCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LevelCreatedImplCopyWithImpl<$Res>
    extends _$LevelStateCopyWithImpl<$Res, _$LevelCreatedImpl>
    implements _$$LevelCreatedImplCopyWith<$Res> {
  __$$LevelCreatedImplCopyWithImpl(
      _$LevelCreatedImpl _value, $Res Function(_$LevelCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LevelCreatedImpl implements _LevelCreated {
  const _$LevelCreatedImpl();

  @override
  String toString() {
    return 'LevelState.levelCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LevelCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) {
    return levelCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) {
    return levelCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
    required TResult orElse(),
  }) {
    if (levelCreated != null) {
      return levelCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) {
    return levelCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) {
    return levelCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) {
    if (levelCreated != null) {
      return levelCreated(this);
    }
    return orElse();
  }
}

abstract class _LevelCreated implements LevelState {
  const factory _LevelCreated() = _$LevelCreatedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LevelStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'LevelState.apiError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchingLevels,
    required TResult Function() levelsFetched,
    required TResult Function() creatingLevel,
    required TResult Function() levelCreated,
    required TResult Function(String error) apiError,
  }) {
    return apiError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchingLevels,
    TResult? Function()? levelsFetched,
    TResult? Function()? creatingLevel,
    TResult? Function()? levelCreated,
    TResult? Function(String error)? apiError,
  }) {
    return apiError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchingLevels,
    TResult Function()? levelsFetched,
    TResult Function()? creatingLevel,
    TResult Function()? levelCreated,
    TResult Function(String error)? apiError,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchingLevels value) fetchingLevels,
    required TResult Function(_LevelsFetched value) levelsFetched,
    required TResult Function(_CreatingLevel value) creatingLevel,
    required TResult Function(_LevelCreated value) levelCreated,
    required TResult Function(_Error value) apiError,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchingLevels value)? fetchingLevels,
    TResult? Function(_LevelsFetched value)? levelsFetched,
    TResult? Function(_CreatingLevel value)? creatingLevel,
    TResult? Function(_LevelCreated value)? levelCreated,
    TResult? Function(_Error value)? apiError,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchingLevels value)? fetchingLevels,
    TResult Function(_LevelsFetched value)? levelsFetched,
    TResult Function(_CreatingLevel value)? creatingLevel,
    TResult Function(_LevelCreated value)? levelCreated,
    TResult Function(_Error value)? apiError,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _Error implements LevelState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of LevelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
