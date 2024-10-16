import 'package:admin_app/feature/user/data/repo/user.repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/source/user.api.dart';

Future<void> setupUserDi(GetIt getIt) async {
  getIt.registerFactory<UserApi>(() => UserApi(getIt<Dio>()));
  getIt.registerFactory<UserRepo>(() => UserRepo());
}
