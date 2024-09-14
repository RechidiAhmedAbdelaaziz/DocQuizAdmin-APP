import 'package:json_annotation/json_annotation.dart';

part 'statistique.model.g.dart';

@JsonSerializable(createToJson: false)
class StatisticsModel {
  StatisticsModel({
    this.totalSources,
    this.totalExam,
    this.totalQuestion,
    this.totalUser,
    this.totalSubscribedUser,
    this.totalMajor,
    this.totalDomain,
    this.quizDoneToday,
  });

  num? totalSources;
  num? totalExam;
  num? totalQuestion;
  num? totalUser;
  num? totalSubscribedUser;
  num? totalMajor;
  num? totalDomain;
  num? quizDoneToday;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);

  copyWith(StatisticsModel statistic) {
    totalSources = statistic.totalSources;
    totalExam = statistic.totalExam;
    totalQuestion = statistic.totalQuestion;
    totalUser = statistic.totalUser;
    totalSubscribedUser = statistic.totalSubscribedUser;
    totalMajor = statistic.totalMajor;
    totalDomain = statistic.totalDomain;
    quizDoneToday = statistic.quizDoneToday;
  }
}
