import 'package:admin_app/core/extension/list.extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/question.model.dart';

part 'create_question.dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateQuestionBody {
  CreateQuestionBody({
    this.questionText,
    List<String> correctAnswers = const [],
    List<String> wrongAnswers = const [],
    this.difficulty = 'medium',
    this.field,
    this.source,
    this.explanation,
  })  : _wrongAnswers = wrongAnswers,
        _correctAnswers = correctAnswers;

  String? questionText;
  final List<String> _correctAnswers;
  final List<String> _wrongAnswers;
  String? difficulty;
  FieldModel? field;
  String? source;
  String? explanation;

  List<String> get answers => _correctAnswers + _wrongAnswers;

  Map<String, dynamic> toJson() => _$CreateQuestionBodyToJson(this);

  void setQuestionText(String text) => questionText = text;

  void setDifficulty(String value) => difficulty = value;

  void setField(FieldModel value) => field = value;

  void setSource(String value) => source = value;

  void setExplanation(String value) => explanation = value;

  void addAnswer({
    required String answer,
    required bool isCorrect,
  }) {
    if (isCorrect) {
      _wrongAnswers.remove(answer);
      _correctAnswers.addUniq(answer);
    } else {
      _correctAnswers.remove(answer);
      _wrongAnswers.addUniq(answer);
    }
  }

  factory CreateQuestionBody.fromQuestion(QuestionModel question) =>
      CreateQuestionBody(
        questionText: question.questionText,
        correctAnswers: question.correctAnswers ?? [],
        wrongAnswers: question.wrongAnswers ?? [],
        difficulty: question.difficulty,
        field: question.field,
        source: question.source?.id,
        explanation: question.explanation,
      );
}
