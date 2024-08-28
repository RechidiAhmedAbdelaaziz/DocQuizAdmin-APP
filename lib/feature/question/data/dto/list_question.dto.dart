import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_question.dto.g.dart';

@JsonSerializable(createFactory: false)
class ListQuestionsBody {
  ListQuestionsBody({
    this.types,
    this.difficulties,
    this.source,
    this.fields,
    this.withExplanation,
  });

  List<String>? types;
  List<String>? difficulties;
  String? source;
  List<FieldModel>? fields;
  bool? withExplanation;

  Map<String, dynamic> toJson() => _$ListQuestionsBodyToJson(this);
 
}
