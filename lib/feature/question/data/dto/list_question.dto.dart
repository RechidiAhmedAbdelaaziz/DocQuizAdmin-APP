import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_question.dto.g.dart';

@JsonSerializable()
class ListQuestionsBody {
  ListQuestionsBody({
    required this.types,
    required this.difficulties,
    required this.source,
    required this.fields,
    required this.withExplanation,
  });

  final List<String>? types;
  final List<String>? difficulties;
  final String? source;
  final List<FieldModel>? fields;
  final bool? withExplanation;

  factory ListQuestionsBody.fromJson(Map<String, dynamic> json) =>
      _$ListQuestionsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ListQuestionsBodyToJson(this);
}
