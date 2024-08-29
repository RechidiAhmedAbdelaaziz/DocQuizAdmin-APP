import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_filter.state.dart';
part 'question_filter.cubit.freezed.dart';

class QuestionFilterCubit extends Cubit<QuestionFilterState> {
  QuestionFilterCubit({
    ListQuestionsBody? filter,
  })  : _filter = filter ?? ListQuestionsBody(),
        super(const QuestionFilterState.initial());

  final ListQuestionsBody _filter;

  ListQuestionsBody get filter => _filter;

  List<String> get types => _filter.types ?? [];
  List<String> get difficulties => _filter.difficulties ?? [];
  bool get withExplanation => _filter.withExplanation ?? false;

  void filterType(String type) => _setFilter(type: type);
  void filterDifficulty(String difficulty) =>
      _setFilter(difficulty: difficulty);
  void filterSource(String source) => _setFilter(source: source);
  void filterFields(List<FieldModel> fields) =>
      _setFilter(fields: fields);
  void filterWithExplanation(bool withExplanation) =>
      _setFilter(withExplanation: withExplanation);

  void clearFilter() {
    _filter.clear();
    emit(const QuestionFilterState.initial());
  }

  void _setFilter({
    String? type,
    String? difficulty,
    String? source,
    List<FieldModel>? fields,
    bool? withExplanation,
  }) {
    emit(const QuestionFilterState.filtering());
    _filter.copyWith(
      type: type,
      difficulty: difficulty,
      source: source,
      fields: fields,
      withExplanation: withExplanation,
    );
    emit(const QuestionFilterState.filtered());
  }
}
