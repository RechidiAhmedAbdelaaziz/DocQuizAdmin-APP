import 'package:admin_app/module/auth/data/repository/auth.repository.dart';
import 'package:admin_app/module/auth/data/source/auth.api.dart';
import 'package:admin_app/module/auth/domain/usecases/login.usecase.dart';
import 'package:admin_app/module/auth/data/source/auth.cache.dart';
import 'package:admin_app/module/auth/logic/auth.cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

part 'login.dependency.dart';

Future<void> setupAuthDependency(GetIt locator) async {
  locator.registerLazySingleton(() => AuthApiService(locator<Dio>()));
  locator.registerLazySingleton(() => AuthCacheHelper());

  locator.registerLazySingleton(() => AuthRepository());

  locator.registerLazySingleton(() => AuthCubit()..checkAuth());

  await _setupLoginDependency(locator);
}
