part of 'course.cubit.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState.initial() = _Initial;

  const factory CourseState.addingCourse() = _AddingCourse;
  const factory CourseState.courseAdded() = _CourseAdded;

  const factory CourseState.fetchingCourses() = _FetchingCourses;
  const factory CourseState.coursesFetched() = _CoursesFetched;

  const factory CourseState.apiError(String message) = _ApiError;
}
