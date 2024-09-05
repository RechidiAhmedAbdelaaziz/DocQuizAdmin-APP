import 'package:admin_app/feature/question/data/models/question.model.dart';


class ListQuestionsFilter {
  ListQuestionsFilter({
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> queryMap = <String, dynamic>{};

    // Handle 'types' list
    if (types != null) {
      for (int i = 0; i < types!.length; i++) {
        queryMap['types[$i]'] = types![i];
      }
    }

    // Handle 'difficulties' list
    if (difficulties != null) {
      for (int i = 0; i < difficulties!.length; i++) {
        queryMap['difficulties[$i]'] = difficulties![i];
      }
    }

    // Handle 'source'
    if (source != null) {
      queryMap['source'] = source;
    }

    // Handle 'fields' list of FieldModel
    if (fields != null) {
      for (int i = 0; i < fields!.length; i++) {
        final field = fields![i];
        if (field.level != null)
          queryMap['fields[$i][level]'] = field.level;
        if (field.major != null)
          queryMap['fields[$i][major]'] = field.major;
        if (field.course != null)
          queryMap['fields[$i][course]'] = field.course;
      }
    }

    // Handle 'withExplanation' boolean
    if (withExplanation != null) {
      queryMap['withExplanation'] = withExplanation.toString();
    }

    return queryMap;
  }

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

  void clear() {
    types = null;
    difficulties = null;
    withExplanation = null;
  }
}
