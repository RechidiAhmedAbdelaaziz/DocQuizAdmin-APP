part of 'exam.cubit.dart';

@freezed
class ExamState with _$ExamState {
  const factory ExamState.initial() = _Initial;

  const factory ExamState.fetchingExams() = _FetchingExams;
  const factory ExamState.fetchedExams() = _FetchedExams;

  const factory ExamState.examCreating() = _ExamCreating;
  const factory ExamState.examCreated() = _ExamCreated;

  const factory ExamState.error(String message) = _Error;
}
