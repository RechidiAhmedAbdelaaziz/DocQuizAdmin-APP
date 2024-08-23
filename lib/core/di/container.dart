import 'package:admin_app/core/helpers/cache.helper.dart';
import 'package:admin_app/core/helpers/dio.helper.dart';
import 'package:admin_app/core/helpers/picker.helper.dart';
import 'package:admin_app/core/router/navigator.dart';
import 'package:admin_app/module/auth/helpers/auth.dependency.dart';
import 'package:admin_app/module/exam/helper/exam.dependency.dart';
import 'package:admin_app/module/levels/helpers/level.dependency.dart';
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
  locator.registerLazySingleton(() => ImagePickerHelper());

  locator.registerSingleton(NormalNavigator());
  locator.registerSingleton(NoPopNavigator());

  await setupAuthDependency(locator);
  await setupLevelDependency(locator);
  await setupExamDependency(locator);
}
