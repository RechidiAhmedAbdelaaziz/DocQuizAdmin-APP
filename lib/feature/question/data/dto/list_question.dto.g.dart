// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_question.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListQuestionsBody _$ListQuestionsBodyFromJson(
        Map<String, dynamic> json) =>
    ListQuestionsBody(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      difficulties: (json['difficulties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      source: json['source'] as String?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => FieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      withExplanation: json['withExplanation'] as bool?,
    );

Map<String, dynamic> _$ListQuestionsBodyToJson(
        ListQuestionsBody instance) =>
    <String, dynamic>{
      'types': instance.types,
      'difficulties': instance.difficulties,
      'source': instance.source,
      'fields': instance.fields,
      'withExplanation': instance.withExplanation,
    };
