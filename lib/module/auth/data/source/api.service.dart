import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/module/auth/data/models/login_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(UserApiConstants.login)
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);
}
