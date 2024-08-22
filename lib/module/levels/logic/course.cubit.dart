import 'package:admin_app/core/di/container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/level.model.dart';
import '../data/repo/level.repo.dart';

part 'course.state.dart';
part 'course.cubit.freezed.dart';

class CourseCubit extends Cubit<CourseState> {
  final _levelRepo = locator<LevelRepo>();

  final String _level;
  final String _major;

  CourseCubit(this._level, this._major)
      : super(const CourseState.initial());

  final List<CourseModel> _courses = [];

  List<CourseModel> get courses => _courses;

  Future<void> addCourse({
    required String name,
    required bool isFree,
  }) async {
    emit(const CourseState.addingCourse());
    final result = await _levelRepo.addCourse(
      level: _level,
      major: _major,
      name: name,
      isFree: isFree,
    );
    result.when(
      success: (data) {
        _courses.add(data);
        emit(const CourseState.courseAdded());
      },
      failure: (error) => emit(CourseState.apiError(error.message)),
    );
  }

  Future<void> fetchCourses() async {
    emit(const CourseState.fetchingCourses());
    final result =
        await _levelRepo.getCourses(level: _level, major: _major);
    result.when(
      success: (data) {
        _courses.addAll(data);
        emit(const CourseState.coursesFetched());
      },
      failure: (error) => emit(CourseState.apiError(error.message)),
    );
  }
}
