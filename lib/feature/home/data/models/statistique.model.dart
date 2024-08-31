import 'package:json_annotation/json_annotation.dart';

part 'statistique.model.g.dart';

@JsonSerializable(createToJson: false)
class StatisticsModel {
  StatisticsModel({
    this.totalExam,
    this.totalQuestion,
    this.totalUser,
    this.totalSubscribedUser,
    this.totalMajor,
  });

  num? totalExam;
  num? totalQuestion;
  num? totalUser;
  num? totalSubscribedUser;
  num? totalMajor;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);

  void copyWith(StatisticsModel statistics) {
    totalExam = statistics.totalExam;
    totalQuestion = statistics.totalQuestion;
    totalUser = statistics.totalUser;
    totalSubscribedUser = statistics.totalSubscribedUser;
    totalMajor = statistics.totalMajor;
  }
}
