import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/shared/dto/pagination.dto.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/data/source/question.api.dart';

import '../dto/list_question.dto.dart';

class QuestionRepo {
  final _questionApi = locator<QuestionApiService>();

  RepoResult<QuestionModel> createQuestion({
    required CreateQuestionBody body,
  }) async {
    apiCall() async {
      final result = await _questionApi.createQuestion(body.toJson());
      return QuestionModel.fromJson(result.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<QuestionModel> updateQuestion({
    required String id,
    required CreateQuestionBody body,
  }) async {
    apiCall() async {
      final result =
          await _questionApi.updateQuestion(id, body.toJson());
      return QuestionModel.fromJson(result.data!);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteQuestion({
    required String id,
  }) async {
    apiCall() async {
      await _questionApi.deleteQuestion(id);
    }

    return await TryCallApi.call(apiCall);
  }

  RepoListResult<QuestionModel> getQuestions({
    required PaginationQuery queries,
    required ListQuestionsBody body,
  }) async {
    apiCall() async {
      final result = await _questionApi.getQuestions(
        queries: queries.toJson(),
        body: body.toJson(),
      );
      return result.data!
          .map((e) => QuestionModel.fromJson(e))
          .toList();
    }

    return await TryCallApi.call(apiCall);
  }
}
