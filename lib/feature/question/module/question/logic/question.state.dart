part of 'question.cubit.dart';

class QuestionState {
  final QuestionDetails? _details;
  final String? error;

  QuestionState(this._details, {this.error});

  QuestionDetails get details => _details!;

  factory QuestionState.initial(QuestionModel? question) {
    return QuestionState(QuestionDetails(question: question));
  }

  QuestionState addAnswer() {
    details.newAnswer = '';
    return QuestionState(details);
  }

  QuestionState updateAnswer(QuestionAnswer answer) {
    details.updateAnswer = answer;
    return QuestionState(details);
  }

  QuestionState removeAnswer(QuestionAnswer answer) {
    details.removeAnswer = answer;
    return QuestionState(details);
  }

  QuestionState update({
    SourceModel? source,
    CourseModel? course,
    ExamModel? exam,
    bool removeExam = false,
  }) {
    if (source != null) details.updateSource = source;
    if (course != null) details.updateCourse = course;
    if (exam != null) details.updateExam = exam;
    if (removeExam) details.updateExam = null;

    return QuestionState(details);
  }

  QuestionState saving() => _Saving(details);

  QuestionState saved(QuestionModel question) => _Saved(question);

  QuestionState errorOccured(String error) =>
      QuestionState(details, error: error);

  void onError(void Function(String error) onError) {
    if (error != null) onError(error!);
  }

  void onSaved(void Function(QuestionModel question) onSaved) {
    if (this is _Saved) onSaved((this as _Saved).question);
  }

  bool get isSaving => this is _Saving || this is _Saved;
}

class _Saving extends QuestionState {
  _Saving(super.details);
}

class _Saved extends QuestionState {
  final QuestionModel question;

  _Saved(this.question) : super(null);
}
