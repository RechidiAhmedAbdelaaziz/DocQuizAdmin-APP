import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/course/data/repo/course.repo.dart';
import 'package:admin_app/feature/course/data/source/course.api.dart';

Future<void> setupCourseDependency() async {
  locator.registerLazySingleton(() => CourseApi(locator()));
  locator.registerLazySingleton(() => CourseRepo());
}
