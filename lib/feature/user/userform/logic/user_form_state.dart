part of 'user_form_cubit.dart';

enum _UserFormStatus {
  initial,
  loading,
  success,
  error,
}

class UserFormState extends CubitErrorState {
  final UserDto userDto;
  final _UserFormStatus _status;

  UserFormState({
    required this.userDto,
    _UserFormStatus status = _UserFormStatus.initial,
    String? error,
  })  : _status = status,
        super(error);

        bool get isLoading => _status == _UserFormStatus.loading;

  factory UserFormState.initial([UserModel? user]) =>
      UserFormState(userDto: UserDto(user));

  UserFormState _copyWith({
    UserDto? userDto,
    _UserFormStatus? status,
    String? error,
  }) {
    return UserFormState(
      userDto: userDto ?? this.userDto,
      status: status ?? _status,
      error: error,
    );
  }

  UserFormState _loading() =>
      _copyWith(status: _UserFormStatus.loading);

  UserFormState _success(UserModel user) => _Success(user);

  UserFormState _error(String error) => _copyWith(
        status: _UserFormStatus.error,
        error: error,
      );

  void onSuccess(void Function(UserModel user) callback) {}

  @override
  List<Object?> get props => [userDto, _status];
}

class _Success extends UserFormState {
  final UserModel user;

  _Success(this.user) : super(userDto: UserDto(user));

  @override
  void onSuccess(void Function(UserModel user) callback) =>
      callback(user);
}
