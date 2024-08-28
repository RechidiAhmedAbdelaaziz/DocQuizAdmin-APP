part of 'question.cubit.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState.initial() = _Initial;

  const factory QuestionState.creatingQuestion() = _CreatingQuestion;
  const factory QuestionState.questionCreated() = _QuestionCreated;

  const factory QuestionState.updatingQuestion() = _UpdatingQuestion;
  const factory QuestionState.questionUpdated() = _QuestionUpdated;

  const factory QuestionState.deletingQuestion() = _DeletingQuestion;
  const factory QuestionState.questionDeleted() = _QuestionDeleted;

  const factory QuestionState.error(String message) = _Error;
}
