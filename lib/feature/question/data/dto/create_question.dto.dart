import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:flutter/material.dart';

import '../models/question.model.dart';

class QuestionDetails {
  QuestionDetails({
    QuestionModel? question,
  })  : answers = question != null
            ? [
                if (question.correctAnswers != null)
                  ...question.correctAnswers!.map((e) =>
                      QuestionAnswer(value: e, isCorrect: true)),
                if (question.wrongAnswers != null)
                  ...question.wrongAnswers!.map((e) =>
                      QuestionAnswer(value: e, isCorrect: false)),
              ]
            : [],
        source = question?.source,
        course = question?.course,
        exam = question?.exam,
        question =
            TextEditingController(text: question?.questionText),
        explanation =
            TextEditingController(text: question?.explanation),
        difficulty =
            TextEditingController(text: question?.difficulty),
        year =
            TextEditingController(text: question?.year?.toString());

  final TextEditingController question;
  final List<QuestionAnswer> answers;
  final TextEditingController explanation;
  final TextEditingController difficulty;
  final SourceModel? source;
  final CourseModel? course;
  final ExamModel? exam;
  final TextEditingController year;

  set newAnswer(String value) =>
      answers.add(QuestionAnswer(value: value, isCorrect: false));

  set updateAnswer(QuestionAnswer answer) =>
      answer.isCorrect = !answer.isCorrect;

  set removeAnswer(QuestionAnswer answer) => answers.remove(answer);

  Map<String, dynamic> toJson() => {
        'questionText': question.text,
        'correctAnswers': answers
            .where((e) => e.isCorrect)
            .map((e) => e.controller.text)
            .toList(),
        'wrongAnswers': answers
            .where((e) => !e.isCorrect)
            .map((e) => e.controller.text)
            .toList(),
        'explanation': explanation.text,
        'difficulty': difficulty.text,
        'sourceId': source?.id,
        'courseId': course?.id,
        'examId': exam?.id,
        'year': year.text,
      };
}

class QuestionAnswer {
  final controller = TextEditingController();
  bool isCorrect;

  QuestionAnswer({
    String? value,
    required this.isCorrect,
  }) {
    if (value != null) controller.text = value;
  }
}
