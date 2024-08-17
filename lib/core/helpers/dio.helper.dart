import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/validator.extension.dart';
import 'package:admin_app/module/auth/data/source/auth.cache.dart';
import 'package:admin_app/module/auth/logic/auth.cubit.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? _dio;

  static Dio getDio()  {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();

      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {'Accept': 'application/json'};

      _dio!.interceptors.add(_prettyDioLogger);

      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void addTokenInterceptor() {
    _dio!.interceptors.add(_setTokensInterceptor);
  }

  static void removeTokenInterceptor() {
    _dio!.interceptors.remove(_setTokensInterceptor);
  }

  static PrettyDioLogger get _prettyDioLogger => PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      );

  static InterceptorsWrapper get _setTokensInterceptor {
    final authCacheHelper = locator<AuthCacheHelper>();
    final authCubit = locator<AuthCubit>();

    return InterceptorsWrapper(

      onRequest: (options, handler) async {
        final accessToken = await authCacheHelper.accessToken;

        options.headers['Authorization'] = 'Bearer $accessToken';
        return handler.next(options);
      },

      // refresh token logic
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await authCacheHelper.refreshToken;

          if (refreshToken.isNotEmptyOrNull) {
            await authCubit.onRefreshToken(refreshToken!);
          }
        }
        return handler.next(error);
      },
    );
  }
}
