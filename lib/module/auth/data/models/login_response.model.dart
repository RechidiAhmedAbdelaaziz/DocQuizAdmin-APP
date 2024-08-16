import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:admin_app/module/auth/data/models/user.model.dart';

class LoginResponseModel extends ApiResponseModel<UserModel> {
  LoginResponseModel({
    super.success,
    super.statusCode,
    super.message,
    super.tokens,
    super.pagination,
    super.data,
  });

  factory LoginResponseModel._fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModel.fromJson(json, UserModel.fromJson);
    return LoginResponseModel(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      message: apiResponseModel.message,
      tokens: apiResponseModel.tokens,
      pagination: apiResponseModel.pagination,
      data: apiResponseModel.data,
    );
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic>? json) =>
      LoginResponseModel._fromJson(json);
}
