import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/home/data/models/statistique.model.dart';

import '../source/home.api.dart';

class HomeRepo {
  final _dataSource = locator<HomeApiService>();

  HomeRepo();

  RepoResult<StatisticsModel> getStatistique() async {
    apiCall() async {
      final response = await _dataSource.getStatistics();
      return StatisticsModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }
}
