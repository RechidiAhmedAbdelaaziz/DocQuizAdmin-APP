import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/course/data/source/course.api.dart';

class CourseRepo {
  final _courseApi = locator<CourseApi>();

  RepoListResult<CourseModel> getCourses(
      {required String majorId}) async {
    apiCall() async {
      final response = await _courseApi.getCourses(majorId: majorId);
      return response.data!
          .map((e) => CourseModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<CourseModel> createCourse({
    required String majorId,
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _courseApi.createCourse(majorId, {'name': name});
      return CourseModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<CourseModel> updateCourse(
    String id, {
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _courseApi.updateCourse(id, {'name': name});
      return CourseModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteCourse(String id) async {
    apiCall() async {
      await _courseApi.deleteCourse(id);
    }

    return await TryCallApi.call(apiCall);
  }
}
