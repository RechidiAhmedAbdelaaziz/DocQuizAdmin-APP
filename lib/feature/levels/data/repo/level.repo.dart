import 'dart:io';

import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/multipartfile.extension.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/levels/data/models/level.model.dart';

import '../source/level.api.dart';

class LevelRepo {
  final _levelApi = locator<LevelApiService>();

  RepoResult<LevelModel> createLevel({
    required String name,
  }) async {
    apiCall() async {
      final response = await _levelApi.createLevel({'name': name});

      return LevelModel.fromJson(response.data);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<MajorModel> addMajor({
    required String level,
    required String name,
    required File? icon,
  }) async {
    apiCall() async {
      final response = await _levelApi.addMajor({
        'level': level,
        'name': name,
        'icon': icon.toMultipartFile,
      });

      return MajorModel.fromJson(response.data);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<CourseModel> addCourse({
    required String level,
    required String major,
    required String name,
    required bool isFree,
  }) async {
    apiCall() async {
      final response = await _levelApi.addCourse({
        'level': level,
        'major': major,
        'name': name,
        'isFree': isFree,
      });

      return CourseModel.fromJson(response.data);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoListResult<LevelModel> getLevels() async {
    apiCall() async {
      final response = await _levelApi.getLevels();
      return response.data!
          .map((e) => LevelModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoListResult<MajorModel> getMajors({
    required String level,
  }) async {
    apiCall() async {
      final response = await _levelApi.getMajors(level);
      return response.data!
          .map((e) => MajorModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoListResult<CourseModel> getCourses({
    required String level,
    required String major,
  }) async {
    apiCall() async {
      final response = await _levelApi.getCourses(level, major);
      return response.data!
          .map((e) => CourseModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }
}
