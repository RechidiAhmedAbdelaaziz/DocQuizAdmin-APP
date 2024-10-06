part of 'question_filter.cubit.dart';

class QuestionFilterState {
  final ListQuestionsFilter filter;

  QuestionFilterState({required this.filter});

  factory QuestionFilterState.initial({
    SourceModel? source,
    CourseModel? course,
    ExamModel? exam,
  }) =>
      QuestionFilterState(
          filter: ListQuestionsFilter(
        sources: source != null ? [source] : [],
        courses: course != null ? [course] : [],
        exam: exam,
      ));

  QuestionFilterState selectType(String type) {
    return QuestionFilterState(filter: filter.copyWith(type: type));
  }

  QuestionFilterState selectDifficulty(String difficulty) {
    return QuestionFilterState(
        filter: filter.copyWith(difficultie: difficulty));
  }

  QuestionFilterState setWithExplanation(bool withExplanation) {
    if (withExplanation) {
      return QuestionFilterState(
          filter: filter.copyWith(withExplanation: !filter.withExplanation));
    } else {
      return QuestionFilterState(
          filter: filter.copyWith(withoutExplanation: !filter.withoutExplanation));
    }
  }
}
