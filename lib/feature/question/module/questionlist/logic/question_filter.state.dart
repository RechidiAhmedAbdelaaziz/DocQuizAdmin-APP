part of 'question_filter.cubit.dart';

@freezed
class QuestionFilterState with _$QuestionFilterState {
  const factory QuestionFilterState.initial() = _Initial;

  const factory QuestionFilterState.filtering() = _Filtering;
  const factory QuestionFilterState.filtered() = _Filtered;
}
