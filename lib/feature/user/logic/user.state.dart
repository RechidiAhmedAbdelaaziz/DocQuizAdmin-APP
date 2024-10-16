part of 'user.cubit.dart';

class UserState {
  final List<UserModel> _users;
  final String? error;

  UserState(this._users, {this.error});

  List<UserModel> get users => _users;

  factory UserState.initial() => UserState([]);

  UserState addUsers(List<UserModel> users) {
    _users.addAllUniq(users);
    return UserState(_users);
  }

  UserState removeUser(UserModel user) {
    _users.remove(user);
    return UserState(_users);
  }

  UserState updateUser(UserModel user) {
    final index = _users.indexOf(user);
    _users[index] = user;
    return UserState(_users);
  }

  UserState updateUsers(List<UserModel> users) {
    return UserState(users);
  }

  UserState updateError(String error) {
    return UserState(_users, error: error);
  }

  void onError(Function(String) onError) {
    if (error != null) {
      onError(error!);
    }
  }
}
