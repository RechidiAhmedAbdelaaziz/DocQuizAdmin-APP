import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam.model.g.dart';

@JsonSerializable(createToJson: false)
class ExamModel extends Equatable {
  const ExamModel({
    required this.questions,
    required this.id,
    required this.title,
    required this.time,
    required this.year,
    required this.city,
    required this.group,
    required this.type,
    required this.major,
    required this.domain,
  });

  final num? questions;
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final num? time;
  final num? year;
  final String? city;
  final String? group;
  final String? type;
  final MajorModel? major;
  final DomainModel? domain;

  ExamModel copyWith({
    num? questions,
    String? id,
    num? quizez,
    String? title,
    num? time,
    num? year,
    String? city,
    String? group,
    String? type,
    MajorModel? major,
    DomainModel? domain,
  }) {
    return ExamModel(
      questions: questions ?? this.questions,
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      year: year ?? this.year,
      city: city ?? this.city,
      group: group ?? this.group,
      type: type ?? this.type,
      major: major ?? this.major,
      domain: domain ?? this.domain,
    );
  }

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);

  @override
  List<Object?> get props => [id];
}

