import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:admin_app/feature/course/data/repo/course.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/course.model.dart';

part 'course.state.dart';

class CourseCubit extends Cubit<CourseState> {
  final _courseRepo = locator<CourseRepo>();
  final MajorModel major;

  CourseCubit(this.major) : super(CourseState.initial());

  Future<void> getCourses() async {
    final result = await _courseRepo.getCourses(majorId: major.id!);
    result.when(
      success: (courses) => emit(state.fetchCourses(courses)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> addCourse(String name) async {
    final result = await _courseRepo.createCourse(
        majorId: major.id!, name: name);
    result.when(
      success: (course) => emit(state.addCourse(course)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> updateCourse(CourseModel course, String name) async {
    final result =
        await _courseRepo.updateCourse(course.id!, name: name);
    result.when(
      success: (course) => emit(state.updateCourse(course)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> deleteCourse(CourseModel course) async {
    final result = await _courseRepo.deleteCourse(course.id!);
    result.when(
      success: (_) => emit(state.deleteCourse(course)),
      error: (error) => emit(state.setError(error.message)),
    );
  }
  
}
