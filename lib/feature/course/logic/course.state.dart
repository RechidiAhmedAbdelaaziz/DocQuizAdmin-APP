part of 'course.cubit.dart';

class CourseState {
  final List<CourseModel> courses;
  final String? error;

  CourseState({this.courses = const [], this.error});

  factory CourseState.initial() => CourseState();

  CourseState fetchCourses(List<CourseModel> courses) =>
      CourseState(courses: courses);

  CourseState addCourse(CourseModel course) =>
      CourseState(courses: [...courses, course]);

  CourseState updateCourse(CourseModel course) {
    courses[courses.indexOf(course)] = course;
    return CourseState(courses: courses);
  }

  CourseState deleteCourse(CourseModel course) {
    courses.remove(course);
    return CourseState(courses: courses);
  }

  CourseState setError(String error) =>
      CourseState(error: error, courses: courses);

  void onError(Function(String) onError) {
    if (error != null) onError(error!);
  }
}
