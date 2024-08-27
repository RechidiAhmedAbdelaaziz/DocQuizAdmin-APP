// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuestionBody _$CreateQuestionBodyFromJson(
        Map<String, dynamic> json) =>
    CreateQuestionBody(
      questionText: json['questionText'] as String?,
      correctAnswers: (json['correctAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wrongAnswers: (json['wrongAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      difficulty: json['difficulty'] as String?,
      field: json['field'] == null
          ? null
          : FieldModel.fromJson(
              json['field'] as Map<String, dynamic>),
      source: json['source'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$CreateQuestionBodyToJson(
        CreateQuestionBody instance) =>
    <String, dynamic>{
      'questionText': instance.questionText,
      'correctAnswers': instance.correctAnswers,
      'wrongAnswers': instance.wrongAnswers,
      'difficulty': instance.difficulty,
      'field': instance.field,
      'source': instance.source,
      'explanation': instance.explanation,
    };
