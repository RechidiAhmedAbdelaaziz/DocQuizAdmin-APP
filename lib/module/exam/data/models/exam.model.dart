import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam.model.g.dart';

@JsonSerializable()
class ExamModel extends Equatable {
  const ExamModel({
    required this.questions,
    required this.id,
    required this.title,
    required this.time,
    required this.year,
  });

  final num? questions;
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final num? time;
  final num? year;

  // title : "Exam: Major | Year | City"
  String get city => title!.split('|').last.trim();
  // remove "Exam: " from title
  String get major => title!.split('|').first.split(':').last.trim();

  ExamModel copyWith({
    num? questions,
    String? id,
    num? quizez,
    String? title,
    num? time,
    num? year,
  }) {
    return ExamModel(
      questions: questions ?? this.questions,
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      year: year ?? this.year,
    );
  }

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelToJson(this);

  @override
  List<Object?> get props => [id];
}
