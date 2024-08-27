part of 'question.model.dart';

@JsonSerializable()
class FieldModel {
  FieldModel({
    required this.level,
    required this.major,
    required this.course,
  });

  final String? level;
  final String? major;
  final String? course;

  factory FieldModel.fromJson(Map<String, dynamic> json) =>
      _$FieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldModelToJson(this);
}
