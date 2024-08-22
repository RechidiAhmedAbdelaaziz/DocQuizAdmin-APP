import 'package:admin_app/core/types/api_result.type.dart';

typedef RepoResult<T> = Future<ApiResult<T>>;
typedef RepoListResult<T> = Future<ApiResult<List<T>>>;
