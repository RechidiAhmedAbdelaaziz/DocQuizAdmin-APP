import 'package:admin_app/core/helpers/dio.helper.dart';
import 'package:admin_app/module/auth/utils/login.dependency.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<Dio>(() => DioFactory.getDio());

  await setupLoginDependency(locator);
}
