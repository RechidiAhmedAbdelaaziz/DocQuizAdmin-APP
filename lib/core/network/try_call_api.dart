import 'package:admin_app/core/network/api_error.handler.dart';
import 'package:admin_app/core/types/api_result.type.dart';
import 'package:flutter/material.dart';

class TryCallApi {
  static Future<ApiResult<T>> call<T>(
      Future<T> Function() apiCall) async {
    try {
      return ApiResult.success(await apiCall());
    } catch (error) {
      debugPrint(
          '\n\n!!!\n TryCallApi error: ${error.toString()} \n!!!\n\n');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
