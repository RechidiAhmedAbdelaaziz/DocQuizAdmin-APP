import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/domain/data/source/domain.api.dart';

import '../data/repo/domain.repo.dart';

Future<void> setupDomainDependency() async {
  locator.registerLazySingleton(() => DomainApi(locator()));
  locator.registerLazySingleton(() => DomainRepo());
}
