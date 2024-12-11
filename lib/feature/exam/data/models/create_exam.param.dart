import 'package:admin_app/core/extension/to_time.extension.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:flutter/material.dart';

class CreateExamParam {
  final TextEditingController city;
  MajorModel? major;
  DomainModel? domain;
  final TextEditingController hours;
  final TextEditingController minutes;
  final TextEditingController year;
  final TextEditingController type;
  final TextEditingController group;

  CreateExamParam({
    ExamModel? exam,
  })  : city = TextEditingController(text: exam?.city),
        major = exam?.major,
        domain = exam?.domain,
        hours = TextEditingController(text: exam?.time?.toHours()),
        minutes =
            TextEditingController(text: exam?.time?.toMinutes()),
        year = TextEditingController(text: exam?.year.toString()),
        type = TextEditingController(text: exam?.type),
        group = TextEditingController(text: exam?.group);

  void setMajor(MajorModel major) => this.major = major;

  void setDomain(DomainModel domain) => this.domain = domain;

  bool get isResidanat =>
      type.text == 'Résidanat blanc' || type.text == 'Résidanat';

  Map<String, dynamic> toJson() {
    return {
      'city': city.text,
      if (major != null) 'majorId': major?.id,
      if (domain != null) 'domainId': domain?.id,
      'time': (int.tryParse(hours.text) ?? 0) * 60 * 60 +
          (int.tryParse(minutes.text) ?? 0) * 60,
      'year': int.tryParse(year.text) ?? 0,
      'type': type.text,
      'group': group.text,
    };
  }
}
