part of 'question.cubit.dart';

enum _QuestionState {
  initial,
  loading,
  loaded,
  error,
}

class QuestionState extends CubitErrorState {
  final QuestionDTO _dto;
  final _QuestionState _state;

  const QuestionState._(this._dto, this._state, {String? error})
      : super(error);

  factory QuestionState.initial(QuestionModel? question) {
    return QuestionState._(
      QuestionDTO(question),
      _QuestionState.initial,
    );
  }
  

  bool get isLoading => _state == _QuestionState.loading;

  QuestionState _copyWith({
    QuestionDTO? dto,
    _QuestionState? state,
    String? error,
  }) {
    return QuestionState._(
      dto ?? _dto,
      state ?? _state,
      error: error,
    );
  }

  QuestionState _loading() {
    return _copyWith(state: _QuestionState.loading);
  }

  QuestionState _loaded(QuestionModel question) {
    return _SavedState(
      question,
      _dto,
    );
  }

  QuestionState _error(String error) {
    return _copyWith(state: _QuestionState.error, error: error);
  }

  @override
  List<Object?> get props => [
        _dto,
        _state,
      ];

  void onSaved(void Function(QuestionModel question) onSaved) {}
}

class _SavedState extends QuestionState {
  final QuestionModel question;

  const _SavedState(this.question, QuestionDTO dto)
      : super._(dto, _QuestionState.loaded);

  @override
  void onSaved(void Function(QuestionModel question) onSaved) {
    onSaved(question);
  }
}
