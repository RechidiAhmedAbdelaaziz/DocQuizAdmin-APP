import 'package:admin_app/feature/question/data/source/question.api.dart';
import 'package:get_it/get_it.dart';

import '../data/repo/question.repo.dart';

Future<void> setupQuestionDependency(GetIt locator) async {
  locator.registerLazySingleton(() => QuestionApiService(locator()));
  locator.registerLazySingleton(() => QuestionRepo());
}
// 