import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/types/cubit_error_state.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/data/repo/question.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question.state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final _questionRepo = locator<QuestionRepo>();
  final String? _questionId;

  QuestionCubit({QuestionModel? question})
      : _questionId = question?.id,
        super(QuestionState.initial(question));

  bool get isEditing => _questionId != null;

  GlobalKey<FormState> get formKey => state._dto.formKey;
  QuestionDTO get dto => state._dto;

  Future<void> save() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    _questionId == null
        ? await _createQuestion()
        : await _updateQuestion();
  }

  Future<void> _createQuestion() async {
    final result =
        await _questionRepo.createQuestion(details: state._dto);

    result.when(
      success: (question) => emit(state._loaded(question)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  Future<void> _updateQuestion() async {
    final result = await _questionRepo.updateQuestion(
      _questionId!,
      body: state._dto,
    );

    result.when(
      success: (question) => emit(state._loaded(question)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
