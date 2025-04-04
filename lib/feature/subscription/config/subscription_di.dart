import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/subscription/data/repository/subscription_repo.dart';
import 'package:admin_app/feature/subscription/data/source/subscription_api.dart';

Future<void> setupSubscriptionDependency() async {
  locator.registerLazySingleton(() => SubscriptionApi(locator()));
  locator.registerLazySingleton(() => SubscriptionRepo());
}
