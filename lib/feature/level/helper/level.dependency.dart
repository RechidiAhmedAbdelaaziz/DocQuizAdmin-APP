import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/level/data/repo/level.repo.dart';
import 'package:admin_app/feature/level/data/source/level.api.dart';

Future<void> setupLevelDependency() async {
  locator.registerLazySingleton(() => LevelApi(locator()));
  locator.registerLazySingleton(() => LevelRepo());
}
