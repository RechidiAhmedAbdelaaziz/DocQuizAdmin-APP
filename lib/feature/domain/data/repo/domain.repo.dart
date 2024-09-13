import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/domain/data/source/domain.api.dart';

class DomainRepo {
  final _domainApi = locator<DomainApi>();

  RepoListResult<DomainModel> getDomains() async {
    apiCall() async {
      final response = await _domainApi.getDomains();
      return response.data!
          .map((e) => DomainModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<DomainModel> createDomain({required String name}) async {
    apiCall() async {
      final response = await _domainApi.createDomain({'name': name});
      return DomainModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<DomainModel> updateDomain(
    String id, {
    required String name,
  }) async {
    apiCall() async {
      final response =
          await _domainApi.updateDomain(id, {'name': name});
      return DomainModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteDomain(String id) async {
    apiCall() async => await _domainApi.deleteDomain(id);

    return await TryCallApi.call(apiCall);
  }
}
