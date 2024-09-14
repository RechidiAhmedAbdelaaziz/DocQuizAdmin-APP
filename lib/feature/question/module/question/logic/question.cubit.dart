import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/data/repo/question.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question.state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final _questionRepo = locator<QuestionRepo>();
  final String? _questionId;
  final QuestionModel? _question;

  QuestionCubit({QuestionModel? question})
      : _question = question,
        _questionId = question?.id,
        super(QuestionState.initial(question));

        bool get isEditing => _questionId != null;

  final formKey = GlobalKey<FormState>();

  void addAnswer() => emit(state.addAnswer());

  void updateAnswer(QuestionAnswer answer) =>
      emit(state.updateAnswer(answer));

  void removeAnswer(QuestionAnswer answer) =>
      emit(state.removeAnswer(answer));

  Future<void> save() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.saving());

    _questionId == null
        ? await _createQuestion()
        : await _updateQuestion();
  }

  Future<void> delete() async {
    if (_questionId == null) return;

    final result = await _questionRepo.deleteQuestion(_questionId);

    result.when(
      success: (_) => emit(state.deleted(_question!)),
      error: (error) => emit(state.errorOccured(error.message)),
    );
  }

  Future<void> _createQuestion() async {
    final result =
        await _questionRepo.createQuestion(details: state.details);

    result.when(
      success: (question) => emit(state.saved(question)),
      error: (error) => emit(state.errorOccured(error.message)),
    );
  }

  Future<void> _updateQuestion() async {
    final result = await _questionRepo.updateQuestion(
      _questionId!,
      body: state.details,
    );

    result.when(
      success: (question) => emit(state.saved(question)),
      error: (error) => emit(state.errorOccured(error.message)),
    );
  }
}
