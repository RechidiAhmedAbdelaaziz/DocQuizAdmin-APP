import 'package:admin_app/core/network/models/api_response.model.dart';

class StringsResponse extends ApiResponseModelTMP<List<String>> {
  StringsResponse({
    super.success,
    super.statusCode,
    super.message,
    super.tokens,
    super.pagination,
    super.data,
  });

  factory StringsResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static StringsResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel = ApiResponseModelTMP.fromJson(
      json,
      (data) => data as List<String>? ?? [],
    );
    return StringsResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      message: apiResponseModel.message,
      tokens: apiResponseModel.tokens,
      pagination: apiResponseModel.pagination,
      data: apiResponseModel.data,
    );
  }
}
