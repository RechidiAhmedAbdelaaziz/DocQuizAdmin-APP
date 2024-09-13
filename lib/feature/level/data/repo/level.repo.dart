import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/level/data/source/level.api.dart';

class LevelRepo {
  final _levelApi = locator<LevelApi>();

  RepoListResult<LevelModel> getLevels(
      {required String domainId}) async {
    apiCall() async {
      final response = await _levelApi.getLevels(domainId: domainId);
      return response.data!
          .map((e) => LevelModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<LevelModel> createLevel({
    required String domainId,
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _levelApi.createLevel(domainId, {'name': name});
      return LevelModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<LevelModel> updateLevel(
    String id, {
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _levelApi.updateLevel(id, {'name': name});
      return LevelModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteLevel(String id) async {
    apiCall() async {
      await _levelApi.deleteLevel(id);
    }

    return await TryCallApi.call(apiCall);
  }
}
