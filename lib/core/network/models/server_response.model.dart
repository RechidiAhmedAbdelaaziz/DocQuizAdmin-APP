part 'tokens.model.dart';
part 'pagination.model.dart';

class ApiResponse<T> {
  final bool? success;
  final int? statusCode;
  final String? message;
  final _Tokens? tokens;
  final _Paginations? pagination;
  final T? data;

  ApiResponse({
    this.success,
    this.statusCode,
    this.message,
    this.tokens,
    this.pagination,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic>? json,
      T Function(Map<String, dynamic>?) fromJson) {
    return ApiResponse(
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
