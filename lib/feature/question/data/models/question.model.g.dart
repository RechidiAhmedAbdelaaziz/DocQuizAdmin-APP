// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      id: json['_id'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      caseText: json['caseText'] as String?,
      type: json['type'] as String?,
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      sources: (json['sources'] as List<dynamic>)
          .map((e) => SourceYear.fromJson(e as Map<String, dynamic>))
          .toList(),
      year: json['year'] as num?,
      withExplanation: json['withExplanation'] as bool?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      text: json['text'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      difficulty: json['difficulty'] as String?,
      explanation: json['explanation'] == null
          ? null
          : Explanation.fromJson(json['explanation'] as Map<String, dynamic>),
      type: json['type'] as String?,
      years:
          (json['years'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

SourceYear _$SourceYearFromJson(Map<String, dynamic> json) => SourceYear(
      source: json['source'] == null
          ? null
          : SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      year: (json['year'] as num).toInt(),
    );

Explanation _$ExplanationFromJson(Map<String, dynamic> json) => Explanation(
      text: json['text'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
