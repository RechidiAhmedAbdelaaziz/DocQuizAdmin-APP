import 'package:admin_app/feature/home/data/source/home.api.dart';
import 'package:get_it/get_it.dart';

import '../data/repo/home.repo.dart';

Future<void> setupHomeDependency(GetIt container) async {
  container.registerFactory(() => HomeApiService(container()));
  container.registerFactory(() => HomeRepo());
}
