part 'tokens.model.dart';
part 'pagination.model.dart';

/// A model representing the structure of an API response.
///
/// [T] is the type of data expected in the response.
abstract class ApiResponseModel<T> {
  final bool? success;
  final int? statusCode;
  final String? message;
  final _Tokens? tokens;
  final _Paginations? pagination;
  final T? data;

  ApiResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.tokens,
    this.pagination,
    this.data,
  });

  static ApiResponseModel<T> fromJson<T>(
      Map<String, dynamic>? json,
      T Function(Map<String, dynamic>?) fromJson) {
    return _ApiResponseModelImpl<T>(
      success: json?['success'],
      statusCode: json?['statusCode'],
      message: json?['message'],
      tokens: json?['tokens'] != null
          ? _Tokens.fromJson(json?['tokens'])
          : null,
      pagination: json?['pagination'] != null
          ? _Paginations.fromJson(json?['pagination'])
          : null,
      data: json?['data'] != null ? fromJson(json?['data']) : null,
    );
  }
}

class _ApiResponseModelImpl<T> extends ApiResponseModel<T> {
  _ApiResponseModelImpl({
    super.success,
    super.statusCode,
    super.message,
    super.tokens,
    super.pagination,
    super.data,
  });
}


