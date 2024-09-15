part of 'question_list.cubit.dart';

class QuestionListState {
  final List<QuestionModel> questions;
  final String? error;

  QuestionListState(this.questions, {this.error});

  factory QuestionListState.initial() => QuestionListState([]);

  QuestionListState fetchQuestions(List<QuestionModel> newQuestions) {
    questions.addAllUniq(newQuestions);
    return QuestionListState(questions);
  }

  QuestionListState addQuestion(QuestionModel question) {
    questions.addUniq(question);
    return QuestionListState(questions);
  }

  QuestionListState updateQuestion(QuestionModel question) {
    questions[questions.indexOf(question)] = question;
    return QuestionListState(questions);
  }

  QuestionListState deleteQuestion(QuestionModel question) {
    questions.remove(question);
    return QuestionListState(questions);
  }

  QuestionListState setError(String error) {
    return QuestionListState(questions, error: error);
  }

  void onError(Function(String) onError) {
    if (error != null) onError(error!);
  }
}
