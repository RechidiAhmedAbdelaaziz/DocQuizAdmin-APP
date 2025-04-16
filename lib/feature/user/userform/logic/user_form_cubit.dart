import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/types/cubit_error_state.dart';
import 'package:admin_app/feature/auth/data/models/user.model.dart';
import 'package:admin_app/feature/user/data/dto/user_dto.dart';
import 'package:admin_app/feature/user/data/repo/user.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  final _userRepo = locator<UserRepo>();

  UserFormCubit([UserModel? user])
      : super(UserFormState.initial(user));

  void save() async {
    emit(state._loading());

    final result = await _userRepo.addAdmin(state.userDto);

    result.when(
      success: (user) => emit(state._success(user)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
