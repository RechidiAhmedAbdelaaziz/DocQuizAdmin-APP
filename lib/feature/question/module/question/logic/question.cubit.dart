import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/question/data/dto/create_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/data/repo/question.repo.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
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

  final formKey = GlobalKey<FormState>();

  void addAnswer() => emit(state.addAnswer());

  void updateAnswer(QuestionAnswer answer) =>
      emit(state.updateAnswer(answer));

  void removeAnswer(QuestionAnswer answer) =>
      emit(state.removeAnswer(answer));

  void updateSource(SourceModel? value) =>
      emit(state.update(source: value));
  void updateCourse(CourseModel? value) =>
      emit(state.update(course: value));
  void updateExam(ExamModel? value) =>
      emit(state.update(exam: value));
  void removeExam() => emit(state.update(removeExam: true));

  Future<void> save() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.saving());

    _questionId == null
        ? await _createQuestion()
        : await _updateQuestion();
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
