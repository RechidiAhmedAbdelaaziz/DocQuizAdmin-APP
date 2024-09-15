// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      correctAnswers: (json['correctAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wrongAnswers: (json['wrongAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'] as String?,
      questionText: json['questionText'] as String?,
      difficulty: json['difficulty'] as String?,
      type: json['type'] as String?,
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(
              json['course'] as Map<String, dynamic>),
      explanation: json['explanation'] as String?,
      source: json['source'] == null
          ? null
          : SourceModel.fromJson(
              json['source'] as Map<String, dynamic>),
      year: json['year'] as num?,
      exam: json['exam'] == null
          ? null
          : ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
    );
