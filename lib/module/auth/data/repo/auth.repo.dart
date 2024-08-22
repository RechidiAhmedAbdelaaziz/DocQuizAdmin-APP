import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/types/api_result.type.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/module/auth/data/models/login.response.dart';
import 'package:admin_app/module/auth/data/models/refresh_token.response.dart';

import '../source/auth.api.dart';

class AuthRepository {
  final AuthApiService _apiService;

  AuthRepository() : _apiService = locator();

  Future<ApiResult<LoginResponse>> login(
    String email,
    String password,
  ) async {
    callBack() async {
      final response = await _apiService.login({
        'email': email,
        'password': password,
      });

      return response;
    }

    return await TryCallApi.call(callBack);
  }

  Future<ApiResult<RefreshTokenResponse>> refreshToken(
      String refreshToken) async {
    callBack() async {
      final response = await _apiService.refreshToken(refreshToken);

      return response;
    }

    return await TryCallApi.call(callBack);
  }
}
