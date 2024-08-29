part of 'auth.dependency.dart';


Future<void> _setupLoginDependency(GetIt locator) async {
  locator.registerLazySingleton(() => LoginUsecase());
}
