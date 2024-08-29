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

  set _type(String type) {
    types ??= [];
    types!.contains(type) ? types!.remove(type) : types!.add(type);
    if (types!.isEmpty) types = null;
  }

  set _difficulty(String difficulty) {
    difficulties ??= [];
    difficulties!.contains(difficulty)
        ? difficulties!.remove(difficulty)
        : difficulties!.add(difficulty);
    if (difficulties!.isEmpty) difficulties = null;
  }

  void copyWith({
    String? type,
    String? difficulty,
    String? source,
    List<FieldModel>? fields,
    bool? withExplanation,
  }) {
    if (type != null) _type = type;
    if (difficulty != null) _difficulty = difficulty;
    this.source = source ?? this.source;
    this.fields = fields ?? this.fields;
    this.withExplanation = withExplanation ?? this.withExplanation;
  }

  void clear () {
    types = null;
    difficulties = null;
    withExplanation = null;
  }
}
