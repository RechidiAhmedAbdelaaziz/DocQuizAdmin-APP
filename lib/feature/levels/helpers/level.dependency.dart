import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repo/level.repo.dart';
import '../data/source/level.api.dart';

Future<void> setupLevelDependency(GetIt locator) async {

  locator.registerLazySingleton(() => LevelApiService(locator<Dio>()));
  locator.registerLazySingleton(() => LevelRepo());
  
}