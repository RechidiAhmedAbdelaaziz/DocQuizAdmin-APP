import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/auth/data/models/user.model.dart';
import 'package:admin_app/feature/user/data/source/user.api.dart';

import '../dto/user_dto.dart';

class UserRepo {
  final _userApi = locator<UserApi>();

  RepoListResult<UserModel> getAdmins() async {
    apiCall() async {
      final response = await _userApi.getAdmins();
      return response.data!
          .map((e) => UserModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<UserModel> addAdmin(UserDto dto) async {
    apiCall() async {
      final response = await _userApi.createAdmin(await dto.toMap());
      
      return UserModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteAdmin(String id) async {
    apiCall() async => await _userApi.deleteAdmin(id);

    return await TryCallApi.call(apiCall);
  }
}
