import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/updates/data/model/updates.model.dart';
import 'package:admin_app/feature/updates/data/source/updates.api.dart';

class UpdatesRepo {
  final _updatesApi = locator<UpdatesApi>();

  RepoListResult<UpdatesModel> getUpdates() async {
    apiCall() async {
      final response = await _updatesApi.getUpdates();
      return response.data!
          .map((e) => UpdatesModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<UpdatesModel> createUpdate({
    required String title,
    required String description,
  }) async {
    apiCall() async {
      final response = await _updatesApi.createUpdate({
        'title': title,
        'description': description,
      });
      return UpdatesModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<UpdatesModel> updateUpdate(
    String id, {
    required String title,
    required String description,
  }) async {
    apiCall() async {
      final response = await _updatesApi.updateUpdate(
        id,
        {
          'title': title,
          'description': description,
        },
      );
      return UpdatesModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteUpdate(String id) async {
    apiCall() async => await _updatesApi.deleteUpdate(id);

    return await TryCallApi.call(apiCall);
  }
}
