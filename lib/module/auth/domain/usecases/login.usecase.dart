import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/types/api_result.type.dart';
import 'package:admin_app/module/auth/data/models/login.response.dart';
import 'package:admin_app/module/auth/logic/auth.cubit.dart';

import '../../data/repository/auth.repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository = locator();
  final _authCubit = locator<AuthCubit>();

  Future<ApiResult<LoginResponse>> call(
    String email,
    String password,
  ) async {
    final response = await _authRepository.login(email, password);

    await response.whenOrNull(
      success: (data) async => await _authCubit.onLogin(data),
    );

    return response;
  }
}
