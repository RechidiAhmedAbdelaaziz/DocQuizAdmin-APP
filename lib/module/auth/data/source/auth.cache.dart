import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/helpers/cache.helper.dart';

class AuthCacheHelper {
  final CacheHelper _cacheHelper = locator();

  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _cacheHelper.setSecuredString('ACCESS_TOKEN', accessToken);
    await _cacheHelper.setSecuredString(
        'REFRESH_TOKEN', refreshToken);
  }

  Future<String?> get accessToken async =>
      await _cacheHelper.getSecuredString('ACCESS_TOKEN');

  Future<String?> get refreshToken async =>
      await _cacheHelper.getSecuredString('REFRESH_TOKEN');

  Future<void> clearTokens() async {
    await _cacheHelper.removeSecuredData('TOKEN');
    await _cacheHelper.removeSecuredData('REFRESH_TOKEN');
  }
}
