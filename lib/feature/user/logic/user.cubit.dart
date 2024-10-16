import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/feature/auth/data/models/user.model.dart';
import 'package:admin_app/feature/user/data/repo/user.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user.state.dart';

class UserCubit extends Cubit<UserState> {
  final _userRepo = locator<UserRepo>();
  UserCubit() : super(UserState.initial());

  void getUsers() async {
    final result = await _userRepo.getAdmins();

    result.when(
      success: (users) => emit(state.addUsers(users)),
      error: (error) => emit(state.updateError(error.message)),
    );
  }

  void addUser(String email, {bool? isAdmin}) async {
    final result = await _userRepo.addAdmin(email, isAdmin: isAdmin);

    result.when(
      success: (user) => emit(state.addUsers([user])),
      error: (error) => emit(state.updateError(error.message)),
    );
  }

  void deleteUser(UserModel user) async {
    final result = await _userRepo.deleteAdmin(user.id!);

    result.when(
      success: (_) => emit(state.removeUser(user)),
      error: (error) => emit(state.updateError(error.message)),
    );
  }
}
