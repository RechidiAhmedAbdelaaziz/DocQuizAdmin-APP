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
      exam: json['exam'] == null
          ? null
          : ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      source: json['source'] == null
          ? null
          : SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      year: json['year'] as num?,
      withExplanation : json['withExplanation'] as bool?,
    );

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      text: json['text'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      difficulty: json['difficulty'] as String?,
      explanation: json['explanation'] as String?,
      type: json['type'] as String?,
    );

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
