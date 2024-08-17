import 'package:admin_app/core/network/api_error.handler.dart';
import 'package:admin_app/core/types/api_result.type.dart';

import 'models/api_response.model.dart';

class TryCallApi {
  static Future<ApiResult<T>> call<T extends ApiResponseModel>(
      Future<T> Function() apiCall) async {
    try {
      return ApiResult.success(await apiCall());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
