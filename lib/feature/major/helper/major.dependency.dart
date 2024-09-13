import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/major/data/repo/major.repo.dart';
import 'package:admin_app/feature/major/data/source/major.api.dart';

Future<void> setupMajorDependency() async {
  locator.registerLazySingleton(() => MajorApi(locator()));
  locator.registerLazySingleton(() => MajorRepo());
}
