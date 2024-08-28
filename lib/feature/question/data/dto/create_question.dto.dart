import 'package:json_annotation/json_annotation.dart';

import '../models/question.model.dart';

part 'create_question.dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateQuestionBody {
  CreateQuestionBody({
    this.questionText,
    this.correctAnswers,
    this.wrongAnswers,
    this.difficulty,
    this.field,
    this.source,
    this.explanation,
  });

  String? questionText;
  List<String>? correctAnswers;
  List<String>? wrongAnswers;
  String? difficulty;
  FieldModel? field;
  String? source;
  String? explanation;

  Map<String, dynamic> toJson() => _$CreateQuestionBodyToJson(this);

  void copyWith() {} //TODO implement this
}
