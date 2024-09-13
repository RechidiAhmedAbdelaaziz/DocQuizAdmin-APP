import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/source/data/repo/source.repo.dart';
import 'package:admin_app/feature/source/data/source/source.api.dart';

Future<void> setupSourceDependency() async {
  locator.registerLazySingleton(() => SourceApi(locator()));
  locator.registerLazySingleton(() => SourceRepo());
}
