import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:admin_app/feature/source/data/source/source.api.dart';

class SourceRepo {
  final _sourceApi = locator<SourceApi>();

  RepoListResult<SourceModel> getSources() async {
    apiCall() async {
      final response = await _sourceApi.getSources();
      return response.data!
          .map((source) => SourceModel.fromJson(source))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<SourceModel> createSource({
    required String title,
  }) async {
    apiCall() async {
      final response =
          await _sourceApi.createSource({'title': title});
      return SourceModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<SourceModel> updateSource(
    String id, {
    required String title,
  }) async {
    apiCall() async {
      final response =
          await _sourceApi.updateSource(id, {'title': title});
      return SourceModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteSource(String id) async {
    apiCall() async => await _sourceApi.deleteSource(id);

    return await TryCallApi.call(apiCall);
  }
}
