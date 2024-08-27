import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'field.model.dart';
part 'question.model.g.dart';

@JsonSerializable(createToJson: false)
class QuestionModel {
    QuestionModel({
        required this.correctAnswers,
        required this.wrongAnswers,
        required this.id,
        required this.questionText,
        required this.difficulty,
        required this.type,
        required this.source,
        required this.field,
        required this.explanation,
        required this.createdAt,
        required this.updatedAt,
    });

    final List<String>? correctAnswers;
    final List<String>? wrongAnswers;

    @JsonKey(name: '_id') 
    final String? id;
    final String? questionText;
    final String? difficulty;
    final String? type;
    final ExamModel? source;
    final FieldModel? field;
    final String? explanation;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

}

