import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/core/shared/dto/pagination.dto.dart';
import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repo/question.repo.dart';

part 'question_list.state.dart';
part 'question_list.cubit.freezed.dart';

class QuestionListCubit extends Cubit<QuestionListState> {
  final _questionRepo = locator<QuestionRepo>();

  QuestionListCubit() : super(const QuestionListState.initial());

  final List<QuestionModel> _questions = [];
  final _query = KeywordQuery();

  List<QuestionModel> get questions => _questions;

  void setKeyword(String keyword) =>
      _query.copyWith(keywords: keyword);

  void onAddOrUpdateQuestion(QuestionModel question) {
    emit(const QuestionListState.fetchedQuestions());
    questions.addUniq(question);
    emit(const QuestionListState.fetchedQuestions());
  }

  void onRemoveQuestion(QuestionModel question) {
    emit(const QuestionListState.fetchingQuestions());
    questions.remove(question);
    emit(const QuestionListState.fetchedQuestions());
  }

  Future<void> fetchQuestions({
    ListQuestionsBody? filter,
    bool more = true,
  }) async {
    emit(const QuestionListState.fetchingQuestions());

    final result = await _questionRepo.getQuestions(
      queries: _query,
      body: filter,
    );

    result.when(
      success: (newQuestions) {
        more
            ? _fetchMoreQuestion(newQuestions)
            : _fetchNewQuestion(newQuestions);
        emit(const QuestionListState.fetchedQuestions());
      },
      failure: (error) =>
          emit(QuestionListState.error(error.message)),
    );
  }

  void _fetchMoreQuestion(List<QuestionModel> questions) {
    questions.addAllUniq(questions);
    if (questions.isNotEmpty) _query.copyWith(page: _query.page + 1);
  }

  void _fetchNewQuestion(List<QuestionModel> questions) {
    _questions.clear();
    _questions.addAll(questions);
    _query.copyWith(page: 1);
  }
}
