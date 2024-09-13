import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:admin_app/feature/major/data/source/major.api.dart';

class MajorRepo {
  final _majorApi = locator<MajorApi>();

  RepoListResult<MajorModel> getMajors(
      {required String levelId}) async {
    apiCall() async {
      final response = await _majorApi.getMajors(levelId: levelId);
      return response.data!
          .map((e) => MajorModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<MajorModel> createMajor({
    required String levelId,
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _majorApi.createMajor(levelId, {'name': name});
      return MajorModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<MajorModel> updateMajor(
    String id, {
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _majorApi.updateMajor(id, {'name': name});
      return MajorModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteMajor(String id) async {
    apiCall() async {
      await _majorApi.deleteMajor(id);
    }

    return await TryCallApi.call(apiCall);
  }
}
