// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => ExamModel(
      questions: json['questions'] as num?,
      id: json['_id'] as String?,
      title: json['title'] as String?,
      time: json['time'] as num?,
      year: json['year'] as num?,
    );

Map<String, dynamic> _$ExamModelToJson(ExamModel instance) => <String, dynamic>{
      'questions': instance.questions,
      '_id': instance.id,
      'title': instance.title,
      'time': instance.time,
      'year': instance.year,
    };
