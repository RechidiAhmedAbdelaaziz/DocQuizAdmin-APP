import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/types/api_result.type.dart';
import 'package:admin_app/feature/auth/data/models/login.response.dart';
import 'package:admin_app/feature/auth/logic/auth.cubit.dart';

import '../../data/repo/auth.repo.dart';

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
