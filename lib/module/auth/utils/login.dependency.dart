import 'package:admin_app/module/auth/data/repository/auth.repository.dart';
import 'package:admin_app/module/auth/data/source/api.service.dart';
import 'package:admin_app/module/auth/domain/usecases/login.usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> setupLoginDependency(GetIt locator) async {
  locator.registerLazySingleton(() => AuthApiService(locator<Dio>()));
  locator.registerLazySingleton(() => AuthRepository());

  locator.registerLazySingleton(() => LoginUsecase());

}
