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
    required this.exam,
    required this.course,
    required this.sources,
    required this.year,
    required this.withExplanation,
  });

  @JsonKey(name: '_id')
  final String? id;
  final List<Question>? questions;
  final String? caseText;
  final String? type;
  final ExamModel? exam;
  final CourseModel? course;
  final List<SourceYear> sources;
  final num? year;
  final bool? withExplanation;

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
  });

  final String? text;
  final List<Answer>? answers;
  final String? difficulty;
  final String? explanation;
  final String? type;

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
  });

  final String text;
  final bool isCorrect;

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
