// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelModel _$LevelModelFromJson(Map<String, dynamic> json) =>
    LevelModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      major: (json['major'] as List<dynamic>?)
          ?.map(
              (e) => MajorModel.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$LevelModelToJson(LevelModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'major': instance.major,
    };

MajorModel _$MajorModelFromJson(Map<String, dynamic> json) =>
    MajorModel(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map(
              (e) => CourseModel.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$MajorModelToJson(MajorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'courses': instance.courses,
    };

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) =>
    CourseModel(
      isFree: json['isFree'] as bool?,
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'isFree': instance.isFree,
      '_id': instance.id,
      'name': instance.title,
    };
