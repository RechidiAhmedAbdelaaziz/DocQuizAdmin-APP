import 'package:admin_app/core/network/models/api_response.model.dart';

import '../models/level.model.dart';

class MajorResponse extends ApiResponseModelTMP<MajorModel> {
  MajorResponse({
    super.success,
    super.statusCode,
    super.data,
  });

  factory MajorResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static MajorResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModelTMP.fromJson(json, MajorModel.fromJson);
    return MajorResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      data: apiResponseModel.data,
    );
  }
}

class ListMajorResponse
    extends ApiResponseModelTMP<List<MajorModel>> {
  ListMajorResponse({
    super.success,
    super.statusCode,
    super.pagination,
    super.data,
  });

  factory ListMajorResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static ListMajorResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel = ApiResponseModelTMP.fromJson(
      json,
      (List<Map<String, dynamic>>? data) =>
          data?.map((e) => MajorModel.fromJson(e)).toList() ?? [],
    );

    return ListMajorResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      pagination: apiResponseModel.pagination,
      data: apiResponseModel.data,
    );
  }
}
