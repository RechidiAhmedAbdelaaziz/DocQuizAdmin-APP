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
      source: json['source'] == null
          ? null
          : ExamModel.fromJson(json['source'] as Map<String, dynamic>),
      field: json['field'] == null
          ? null
          : FieldModel.fromJson(json['field'] as Map<String, dynamic>),
      explanation: json['explanation'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

FieldModel _$FieldModelFromJson(Map<String, dynamic> json) => FieldModel(
      level: json['level'] as String?,
      major: json['major'] as String?,
      course: json['course'] as String?,
    );

Map<String, dynamic> _$FieldModelToJson(FieldModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'major': instance.major,
      'course': instance.course,
    };
