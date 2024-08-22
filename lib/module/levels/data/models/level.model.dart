import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level.model.g.dart';
part 'major.model.dart';
part 'course.model.dart';

@JsonSerializable()
class LevelModel  extends Equatable{
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final List<MajorModel>? major;

  const LevelModel({this.id, this.name, this.major});

  

  factory LevelModel.fromJson(Map<String, dynamic>? json) =>
      _$LevelModelFromJson(json ?? {});

  Map<String, dynamic> toJson() => _$LevelModelToJson(this);

  static List<LevelModel> listFromJson(List<Map<String,dynamic>>? data) =>
      data?.map((e) => LevelModel.fromJson(e)).toList() ?? [];

  @override
  List<Object?> get props => [id];
}





