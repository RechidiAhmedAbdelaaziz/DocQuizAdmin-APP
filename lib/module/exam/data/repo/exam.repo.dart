import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/module/exam/data/models/create_exam.param.dart';
import 'package:admin_app/module/exam/data/source/exam.api.dart';

import '../models/exam.model.dart';

class ExamRepo {
  final _examApi = locator<ExamApiService>();

  RepoResult<ExamModel> createExam(CreateExamParam details) async {
    apiCall() async {
      final response = await _examApi.createExam(details.toJson());

      return ExamModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<ExamModel> updateExam(
    String id, {
    String? major,
    int? time,
    int? year,
    String? city,
  }) async {
    apiCall() async {
      final response = await _examApi.updateExam(id, {
        'major': major,
        'time': time,
        'year': year,
        'city': city,
      });

      return ExamModel.fromJson(response.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoListResult<ExamModel> getExams({
    required int page,
    int limit = 15,
  }) async {
    apiCall() async {
      final response =
          await _examApi.getExams(page: page, limit: limit);

      return response.data!
          .map((e) => ExamModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }
}
