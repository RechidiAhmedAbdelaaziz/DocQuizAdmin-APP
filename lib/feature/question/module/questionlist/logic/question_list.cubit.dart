import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/core/types/api_result.type.dart';
import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/data/repo/question.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_list.state.dart';

class QuestionListCubit extends Cubit<QuestionListState> {
  final _questionRepo = locator<QuestionRepo>();
  QuestionListCubit() : super(QuestionListState.initial());

  ListQuestionsFilter filters = ListQuestionsFilter();

  set setFilters(ListQuestionsFilter filters) {
    this.filters = filters.copyWith(page: 1);
    emit(QuestionListState.initial());

    fetchQuestions();
  }

  void onAddQuestion(QuestionModel question) =>
      emit(state.addQuestion(question));

  void onUpdateQuestion(QuestionModel question) =>
      emit(state.updateQuestion(question));

  void onDeleteQuestion(QuestionModel question) =>
      emit(state.deleteQuestion(question));

  Future<void> fetchQuestions() async {
    await _callRepo(
        result: await _questionRepo.getQuestions(filters: filters),
        onSuccess: (questions) {
          if (questions.isNotEmpty) {
            filters = filters.copyWith(page: filters.page + 1);
            emit(state.fetchQuestions(questions));
          }
        });
  }

  Future<void> delete(QuestionModel question) async {
    await _callRepo(
        result: await _questionRepo.deleteQuestion(question.id!),
        onSuccess: (_) => onDeleteQuestion(question));
  }

  Future<void> _callRepo<T>({
    required ApiResult<T> result,
    required void Function(T) onSuccess,
  }) async {
    result.when(
      success: onSuccess,
      error: (error) => emit(state.setError(error.message)),
    );
  }
}
