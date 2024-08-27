import 'package:json_annotation/json_annotation.dart';

import '../models/question.model.dart';

part 'create_question.dto.g.dart';

@JsonSerializable()
class CreateQuestionBody {
  CreateQuestionBody({
    required this.questionText,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.difficulty,
    required this.field,
    required this.source,
    required this.explanation,
  });

  final String? questionText;
  final List<String>? correctAnswers;
  final List<String>? wrongAnswers;
  final String? difficulty;
  final FieldModel? field;
  final String? source;
  final String? explanation;

  factory CreateQuestionBody.fromJson(Map<String, dynamic> json) =>
      _$CreateQuestionBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQuestionBodyToJson(this);
}
