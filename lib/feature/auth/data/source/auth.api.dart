import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login.response.dart';
import '../models/refresh_token.response.dart';

part 'auth.api.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(UserApiConstants.login)
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @GET(UserApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
      @Query('refreshToken') String refreshToken);
}
