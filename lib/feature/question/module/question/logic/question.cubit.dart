import 'dart:ui';

import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repo/question.repo.dart';

part 'question.state.dart';
part 'question.cubit.freezed.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final _questionRepo = locator<QuestionRepo>();
  final QuestionListCubit _questionListCubit;

  QuestionCubit({
    required QuestionListCubit questionListCubit,
    QuestionModel? question,
  })  : _questionListCubit = questionListCubit,
        _details = question != null
            ? CreateQuestionBody.fromQuestion(question)
            : CreateQuestionBody(),
        super(const QuestionState.initial());

  final CreateQuestionBody _details;

  CreateQuestionBody get details => _details;

  void setQuestionText(String text) => _details.setQuestionText(text);

  void setDifficulty(String value) =>
      _updateDetails(() => _details.setDifficulty(value));

  void setField(FieldModel value) => _details.setField(value);

  void setSource(String value) => _details.setSource(value);

  void setExplanation(String value) => _details.setExplanation(value);

  void addAnswer() => _updateDetails(() => _details.addAnswer());

  void updateAnswer(
    int index, {
    String? answer,
    bool? isCorrect,
  }) =>
      _updateDetails(() => _details.updateAnswer(index,
          answer: answer, isCorrect: isCorrect));

  void deleteAnswer(int index) => _updateDetails(() => _details.deleteAnswer(index));

  Future<void> createQuestion() async {
    emit(const QuestionState.creatingQuestion());
    final result = await _questionRepo.createQuestion(body: _details);

    result.when(
      success: (question) {
        _questionListCubit.onAddQuestion(question);
        emit(const QuestionState.questionCreated());
        
      },
      failure: (error) => emit(QuestionState.error(error.message)),
    );
  }

  Future<void> updateQuestion(QuestionModel question) async {
    emit(const QuestionState.updatingQuestion());
    final result = await _questionRepo.updateQuestion(
        id: question.id!, body: _details);

    result.when(
      success: (question) {
        _questionListCubit.onUpdateQuestion(question);
        emit(const QuestionState.questionUpdated());
        
      },
      failure: (error) => emit(QuestionState.error(error.message)),
    );
  }

  Future<void> deleteQuestion(QuestionModel question) async {
    emit(const QuestionState.deletingQuestion());
    final result =
        await _questionRepo.deleteQuestion(id: question.id!);

    result.when(
      success: (_) {
        _questionListCubit.onRemoveQuestion(question);
        emit(const QuestionState.questionDeleted());
      },
      failure: (error) => emit(QuestionState.error(error.message)),
    );
  }

  void _updateDetails(VoidCallback updateCallBack) {
    emit(const QuestionState.loading());
    updateCallBack();
    emit(const QuestionState.loaded());
  }
}
