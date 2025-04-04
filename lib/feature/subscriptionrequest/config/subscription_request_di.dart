

import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/subscriptionrequest/data/repo/subscription_request_repo.dart';
import 'package:admin_app/feature/subscriptionrequest/data/source/subscription_request_api.dart';

Future<void> setupSubscriptionRequestDependency() async {
  locator.registerLazySingleton(() => SubscriptionRequestApi(locator()));
  locator.registerLazySingleton(() => SubscriptionRequestRepo());
}