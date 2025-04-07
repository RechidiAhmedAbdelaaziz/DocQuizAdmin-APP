import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.model.g.dart';

@JsonSerializable(createToJson: false)
class QuestionModel extends Equatable {
  const QuestionModel({
    required this.id,
    required this.questions,
    required this.caseText,
    required this.type,
    required this.exams,
    required this.course,
    required this.sources,
    required this.year,
    required this.withExplanation,
    required this.images,
  });

  @JsonKey(name: '_id')
  final String? id;
  final List<Question>? questions;
  final String? caseText;
  final String? type;
  final List<ExamModel>? exams;
  final CourseModel? course;
  final List<SourceYear> sources;
  final num? year;
  final bool? withExplanation;
  final List<String>? images;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  @override
  List<Object?> get props => [id];
}

@JsonSerializable(createToJson: false)
class Question extends Equatable {
  const Question({
    required this.text,
    required this.answers,
    required this.difficulty,
    required this.explanation,
    required this.type,
    this.years = const [],
    this.images = const [],
  });

  final String? text;
  final List<Answer>? answers;
  final String? difficulty;
  final Explanation? explanation;
  final String? type;
  final List<String>? years;
  final List<String>? images;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  List<Object?> get props => [text];
}

@JsonSerializable(createToJson: false)
class Answer extends Equatable {
  const Answer({
    required this.text,
    required this.isCorrect,
    this.images = const [],
  });

  final String text;
  final bool isCorrect;
  final List<String>? images;

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  @override
  List<Object?> get props => [text];
}

@JsonSerializable(createToJson: false)
class SourceYear extends Equatable {
  final SourceModel? source;
  final int year;

  const SourceYear({
    required this.source,
    required this.year,
  });

  factory SourceYear.fromJson(Map<String, dynamic> json) =>
      _$SourceYearFromJson(json);

  @override
  List<Object?> get props => [source];
}

@JsonSerializable(createToJson: false)
class Explanation extends Equatable {
  const Explanation({
    required this.text,
    required this.images,
  });

  final String text;
  final List<String>? images;

  factory Explanation.fromJson(Map<String, dynamic> json) =>
      _$ExplanationFromJson(json);

  @override
  List<Object?> get props => [text];
}
