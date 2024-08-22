import 'package:admin_app/core/network/models/api_response.model.dart';

class RefreshTokenResponse extends ApiResponseModelTMP<void> {
  RefreshTokenResponse({
    super.success,
    super.statusCode,
    super.message,
    super.tokens,
    super.pagination,
  });

  factory RefreshTokenResponse._fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModelTMP.fromJson(json, (_) {});
    return RefreshTokenResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      message: apiResponseModel.message,
      tokens: apiResponseModel.tokens,
      pagination: apiResponseModel.pagination,
    );
  }

  factory RefreshTokenResponse.fromJson(Map<String, dynamic>? json) =>
      RefreshTokenResponse._fromJson(json);
}
