import 'package:flutter/material.dart';

import '../models/question.model.dart';

class CreateQuestionBody {
  CreateQuestionBody({
    this.questionText,
    List<String> correctAnswers = const [],
    List<String> wrongAnswers = const [],
    this.difficulty = 'medium',
    this.field,
    this.source,
    this.explanation,
  })  : _wrongAnswers = wrongAnswers,
        _correctAnswers = correctAnswers {
    answers = _answers();
  }

  String? questionText;
  final List<String> _correctAnswers;
  final List<String> _wrongAnswers;
  String? difficulty;
  FieldModel? field;
  String? source;
  String? explanation;

  List<Answer> answers = [];

  List<Answer> _answers() => [
        ..._correctAnswers.map((answer) => Answer(
              index: _correctAnswers.indexOf(answer),
              answer: answer,
              isCorrect: true,
            )),
        ..._wrongAnswers.map((answer) => Answer(
              index: _wrongAnswers.indexOf(answer) +
                  _correctAnswers.length,
              answer: answer,
              isCorrect: false,
            )),
      ];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'questionText': questionText,
        'difficulty': difficulty,
        'field': field,
        'source': source,
        'explanation': explanation,
        'correctAnswers': answers
            .where((answer) => answer.isCorrect)
            .map((answer) => answer.answer)
            .toList(),
        'wrongAnswers': answers
            .where((answer) => !answer.isCorrect)
            .map((answer) => answer.answer)
            .toList(),
      };

  void setQuestionText(String text) => questionText = text;

  void setDifficulty(String value) => difficulty = value;

  void setField(FieldModel value) => field = value;

  void setSource(String value) => source = value;

  void setExplanation(String value) => explanation = value;

  void addAnswer() => {
        answers.add(
          Answer(
            index: answers.length,
            answer: '',
            isCorrect: false,
          ),
        )
      };

  void updateAnswer(
    int index, {
    String? answer,
    bool? isCorrect,
  }) {
    if (answer != null) answers[index].answer = answer;
    if (isCorrect != null) answers[index].isCorrect = isCorrect;
  }

  void deleteAnswer(int index) {
    answers.removeAt(index);
    answers = answers
        .map((answer) => answer.index > index
            ? Answer(
                index: answer.index - 1,
                answer: answer.answer,
                isCorrect: answer.isCorrect,
              )
            : answer)
        .toList();
  }

  factory CreateQuestionBody.fromQuestion(QuestionModel question) =>
      CreateQuestionBody(
        questionText: question.questionText,
        correctAnswers: question.correctAnswers ?? [],
        wrongAnswers: question.wrongAnswers ?? [],
        difficulty: question.difficulty,
        field: question.field,
        source: question.source?.id,
        explanation: question.explanation,
      );
}

class Answer {
  Answer({
    required this.index,
    required this.answer,
    required this.isCorrect,
  }) : controller = TextEditingController(text: answer);

  final int index;
  final TextEditingController controller;
  String answer;
  bool isCorrect;

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'isCorrect': isCorrect,
      };
}
