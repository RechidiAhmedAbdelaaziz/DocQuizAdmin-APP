part of 'question.model.dart';

@JsonSerializable()
class FieldModel {
  FieldModel({
     this.level,
     this.major,
     this.course,
  });

  final String? level;
  final String? major;
  final String? course;

  factory FieldModel.fromJson(Map<String, dynamic> json) =>
      _$FieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldModelToJson(this);
}
