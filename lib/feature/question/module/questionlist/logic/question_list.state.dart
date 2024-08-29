part of 'question_list.cubit.dart';

@freezed
class QuestionListState with _$QuestionListState {
  const factory QuestionListState.initial() = _Initial;

  const factory QuestionListState.fetchingQuestions() =
      _FetchingQuestions;
  const factory QuestionListState.fetchedQuestions() =
      _FetchedQuestions;

  const factory QuestionListState.addedQuestions() = _AddedQuestions;
  const factory QuestionListState.updatedQuestions() = _UpdatedQuestions;
  const factory QuestionListState.deletedQuestions() = _DeletedQuestions;

  const factory QuestionListState.error(String message) = _Error;
}
