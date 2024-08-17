import 'package:admin_app/core/helpers/cache.helper.dart';
import 'package:admin_app/core/helpers/dio.helper.dart';
import 'package:admin_app/module/auth/helpers/auth.dependency.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => sharedPref);

  locator.registerLazySingleton(() => const FlutterSecureStorage());

  locator.registerLazySingleton(() => DioHelper.getDio());

  locator.registerLazySingleton(() => CacheHelper());

  await setupAuthDependency(locator);
}
