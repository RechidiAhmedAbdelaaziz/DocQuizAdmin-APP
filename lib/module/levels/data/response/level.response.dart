import 'package:admin_app/core/network/models/api_response.model.dart';

import '../models/level.model.dart';

class LevelResponse extends ApiResponseModelTMP<LevelModel> {
  LevelResponse({
    super.success,
    super.statusCode,
    super.data,
  });

  factory LevelResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static LevelResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModelTMP.fromJson(json, LevelModel.fromJson);
    return LevelResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      data: apiResponseModel.data,
    );
  }
}

class ListLevelResponse
    extends ApiResponseModelTMP<List<LevelModel>> {
  ListLevelResponse({
    super.success,
    super.statusCode,
    super.pagination,
    super.data,
  });

  factory ListLevelResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static ListLevelResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModelTMP.fromJson(json, LevelModel.listFromJson);
    return ListLevelResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      pagination: apiResponseModel.pagination,
      data: apiResponseModel.data,
    );
  }
}
