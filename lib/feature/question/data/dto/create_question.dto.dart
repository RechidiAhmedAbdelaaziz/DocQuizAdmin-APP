import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:flutter/material.dart';

import '../models/question.model.dart';

class QuestionDetails {
  QuestionDetails({
    QuestionModel? question,
  })  : caseText = TextEditingController(text: question?.caseText),
        questions = question != null
            ? [
                ...question.questions!.map(
                  (e) => SubQuestion(question: e),
                )
              ]
            : [SubQuestion()],
        source = question?.source,
        course = question?.course,
        exam = question?.exam,
        year =
            TextEditingController(text: question?.year?.toString());

  final TextEditingController caseText;
  final List<SubQuestion> questions;
  SourceModel? source;
  CourseModel? course;
  ExamModel? exam;
  final TextEditingController year;

  set updateSource(SourceModel? value) => source = value;
  set updateCourse(CourseModel? value) => course = value;
  set updateExam(ExamModel? value) => exam = value;

  void newQuestion() => questions.add(SubQuestion());
  void removeQuestion(SubQuestion question) =>
      questions.remove(question);

  Map<String, dynamic> toJson() => {
        if (questions.length > 1) 'caseText': caseText.text,
        'questions': questions.map((e) => e.toJson()).toList(),
        'sourceId': source?.id,
        'courseId': course?.id,
        if (exam?.id != null) 'examId': exam!.id,
        'year': year.text,
      };
}

class SubQuestion {
  SubQuestion({
    Question? question,
  })  : answers = question != null
            ? [
                ...question.answers!.map(
                  (e) => QuestionAnswer(
                    value: e.text,
                    isCorrect: e.isCorrect,
                  ),
                )
              ]
            : [],
        question = TextEditingController(text: question?.text),
        explanation =
            TextEditingController(text: question?.explanation),
        difficulty =
            TextEditingController(text: question?.difficulty);

  final TextEditingController question;
  final List<QuestionAnswer> answers;
  final TextEditingController explanation;
  final TextEditingController difficulty;

  set newAnswer(String value) =>
      answers.add(QuestionAnswer(value: value, isCorrect: false));

  set updateAnswer(QuestionAnswer answer) =>
      answer.isCorrect = !answer.isCorrect;

  set removeAnswer(QuestionAnswer answer) => answers.remove(answer);

  Map<String, dynamic> toJson() => {
        'text': question.text,
        'answers': answers.map((e) => e.toJson()).toList(),
        'explanation': explanation.text,
        'difficulty': difficulty.text,
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

  Map<String, dynamic> toJson() => {
        'text': controller.text,
        'isCorrect': isCorrect,
      };
}
