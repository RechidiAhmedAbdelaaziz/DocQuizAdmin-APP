part of 'question.cubit.dart';

class QuestionState {
  final QuestionDetails? _details;
  final String? error;

  QuestionState(this._details, {this.error});

  QuestionDetails get details => _details ?? QuestionDetails();

  factory QuestionState.initial(QuestionModel? question) {
    return QuestionState(QuestionDetails(question: question));
  }

  QuestionState addQuestion() {
    details.newQuestion();
    return QuestionState(details);
  }

  QuestionState removeQuestion(SubQuestion question) {
    details.removeQuestion(question);
    return QuestionState(details);
  }

  QuestionState addAnswer(SubQuestion question) {
    question.newAnswer = '';
    return QuestionState(details);
  }

  QuestionState updateAnswer(
      SubQuestion question, QuestionAnswer answer) {
    question.updateAnswer = answer;
    return QuestionState(details);
  }

  QuestionState removeAnswer(
      SubQuestion question, QuestionAnswer answer) {
    question.removeAnswer = answer;
    return QuestionState(details);
  }

  QuestionState update({
    SourceModel? source,
    CourseModel? course,
    ExamModel? exam,
    SourceYearModel? removeSource,
    ExamModel? removeExam ,
  }) {
    if (removeSource != null) {
      details.removeSource = removeSource;
    } else if (source != null) {
      details.addSource = source;
    }

    if (course != null) details.updateCourse = course;
    
    if (removeExam != null) {
      details.removeExam = removeExam;
    } else if (exam != null) {
      details.addExam = exam;
    }

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
