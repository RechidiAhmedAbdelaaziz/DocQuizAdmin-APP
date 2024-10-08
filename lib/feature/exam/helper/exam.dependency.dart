import 'package:admin_app/feature/exam/data/repo/exam.repo.dart';
import 'package:admin_app/feature/exam/data/source/exam.api.dart';
import 'package:get_it/get_it.dart';

Future<void> setupExamDependency(GetIt locator) async {
  locator.registerLazySingleton(() => ExamApiService(locator()));
  locator.registerLazySingleton(() => ExamRepo());
}
