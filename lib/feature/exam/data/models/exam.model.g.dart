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
      city: json['city'] as String?,
      group: json['group'] as String?,
      type: json['type'] as String?,
      major: json['major'] == null
          ? null
          : MajorModel.fromJson(json['major'] as Map<String, dynamic>),
      domain: json['domain'] == null
          ? null
          : DomainModel.fromJson(json['domain'] as Map<String, dynamic>),
    );
