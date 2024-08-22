part of 'level.model.dart';

@JsonSerializable()
class MajorModel {
  final String? name;
  final String? icon;
  final List<CourseModel>? courses;

  MajorModel({this.name, this.icon, this.courses});

  factory MajorModel.fromJson(Map<String, dynamic>? json) =>
      _$MajorModelFromJson(json ?? {});

  Map<String, dynamic> toJson() => _$MajorModelToJson(this);
}
