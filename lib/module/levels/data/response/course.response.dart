import 'package:admin_app/core/network/models/api_response.model.dart';

import '../models/level.model.dart';

class CourseResponse extends ApiResponseModelTMP<CourseModel> {
  CourseResponse({
    super.success,
    super.statusCode,
    super.data,
  });

  factory CourseResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static CourseResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel =
        ApiResponseModelTMP.fromJson(json, CourseModel.fromJson);
    return CourseResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      data: apiResponseModel.data,
    );
  }
}

class ListCourseResponse
    extends ApiResponseModelTMP<List<CourseModel>> {
  ListCourseResponse({
    super.success,
    super.statusCode,
    super.pagination,
    super.data,
  });

  factory ListCourseResponse.fromJson(Map<String, dynamic>? json) =>
      _fromJson(json);

  static ListCourseResponse _fromJson(Map<String, dynamic>? json) {
    final apiResponseModel = ApiResponseModelTMP.fromJson(
      json,
      (List<Map<String, dynamic>>? data) =>
          data?.map((e) => CourseModel.fromJson(e)).toList() ?? [],
    );
    return ListCourseResponse(
      success: apiResponseModel.success,
      statusCode: apiResponseModel.statusCode,
      pagination: apiResponseModel.pagination,
      data: apiResponseModel.data,
    );
  }
}
