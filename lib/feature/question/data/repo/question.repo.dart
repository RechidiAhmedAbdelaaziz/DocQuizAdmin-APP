import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/data/source/question.api.dart';

import '../dto/list_question.dto.dart';

class QuestionRepo {
  final _questionApi = locator<QuestionApiService>();

  RepoResult<QuestionModel> createQuestion({
    required QuestionDetails details,
  }) async {
    apiCall() async {
      final result =
          await _questionApi.createQuestion(details.toJson());
      return QuestionModel.fromJson(result.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<QuestionModel> updateQuestion(String id,
      {required QuestionDetails body}) async {
    apiCall() async {
      final result =
          await _questionApi.updateQuestion(id, body.toJson());
      return QuestionModel.fromJson(result.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteQuestion(String id) async {
    apiCall() async {
      await _questionApi.deleteQuestion(id);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoListResult<QuestionModel> getQuestions({
    required ListQuestionsFilter filters,
  }) async {
    apiCall() async {
      final result = await _questionApi.getQuestions(
        queries: filters.toQueryMap(),
      );
      return result.data!
          .map((e) => QuestionModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }
}
