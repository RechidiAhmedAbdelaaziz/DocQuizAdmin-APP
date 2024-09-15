import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.model.g.dart';

@JsonSerializable(createToJson: false)
class QuestionModel extends Equatable {
  const QuestionModel({
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.id,
    required this.questionText,
    required this.difficulty,
    required this.type,
    required this.course,
    required this.explanation,
    required this.source,
    required this.year,
    required this.exam,
  });

  final List<String>? correctAnswers;
  final List<String>? wrongAnswers;

  @JsonKey(name: '_id')
  final String? id;
  final String? questionText;
  final String? difficulty;
  final String? type;
  final CourseModel? course;
  final String? explanation;
  final SourceModel? source;
  final num? year;
  final ExamModel? exam;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
