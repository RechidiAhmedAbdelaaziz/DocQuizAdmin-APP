import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:admin_app/module/auth/data/models/user.model.dart';

class LoginResponse extends ApiResponseModelTMP<UserModel> {
  LoginResponse({
    super.success,
    super.statusCode,
    super.message,
    super.tokens,
    super.pagination,
    super.data,
  });

  factory LoginResponse._fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModelTMP.fromJson(json, UserModel.fromJson);
    return LoginResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      message: apiResponseModel.message,
      tokens: apiResponseModel.tokens,
      pagination: apiResponseModel.pagination,
      data: apiResponseModel.data,
    );
  }

  factory LoginResponse.fromJson(Map<String, dynamic>? json) =>
      LoginResponse._fromJson(json);
}
