import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:equatable/equatable.dart';
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
        sources = question?.sources
                .map(
                  (e) => SourceYearModel(
                    source: e.source!,
                    year: e.year.toString(),
                  ),
                )
                .toList() ??
            [],
        course = question?.course,
        exams = question?.exams ?? [];

  final TextEditingController caseText;
  final List<SubQuestion> questions;
  List<SourceYearModel> sources;
  CourseModel? course;
  List<ExamModel> exams;

  set addSource(SourceModel? value) =>
      sources.add(SourceYearModel(source: value!));
  set removeSource(SourceYearModel source) => sources.remove(source);

  set updateCourse(CourseModel? value) => course = value;

  set addExam(ExamModel value) => exams.add(value);
  set removeExam(ExamModel exam) => exams.remove(exam);

  void newQuestion() => questions.add(SubQuestion());
  void removeQuestion(SubQuestion question) =>
      questions.remove(question);

  Map<String, dynamic> toJson() => {
        if (questions.length > 1) 'caseText': caseText.text,
        'questions': questions.map((e) => e.toJson()).toList(),
        'sources': sources.map((e) => e.toJson()).toList(),
        'courseId': course?.id,
        if (exams.isNotEmpty)
          'examIds': exams.map((e) => e.id).toList(),
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

// ignore: must_be_immutable
class SourceYearModel extends Equatable {
  final controller = TextEditingController();
  SourceModel source;

  SourceYearModel({required this.source, String? year}) {
    if (year != null) controller.text = year;
  }

  Map<String, dynamic> toJson() => {
        'sourceId': source.id,
        'year': controller.text,
      };

  @override
  List<Object?> get props => [source];
}
