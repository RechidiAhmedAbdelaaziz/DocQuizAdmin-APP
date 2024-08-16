import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/types/api_result.type.dart';
import 'package:admin_app/module/auth/data/models/login_response.model.dart';

import '../../data/repository/auth.repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase() : _authRepository = locator<AuthRepository>();

  Future<ApiResult<LoginResponseModel>> call(
    String email,
    String password,
  ) async {
    final response = await _authRepository.login(email, password);

    response.when(success: (data) {
    }, failure: (error) {
    });
    //TODO save tokens to local storage

    return response;
  }
}
