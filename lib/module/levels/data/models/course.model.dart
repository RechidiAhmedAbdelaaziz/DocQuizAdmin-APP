part of 'level.model.dart';

@JsonSerializable()
class CourseModel {
  final bool? isFree;
  @JsonKey(name: '_id')
  final String? id;
  final String? title; 

  CourseModel({this.isFree, this.id, this.title});

  factory CourseModel.fromJson(Map<String, dynamic>? json) =>
      _$CourseModelFromJson(json ?? {});

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
