class CreateExamParam {
  final String city;
  final String major;
  final int time;
  final int year;

  CreateExamParam({
    required this.city,
    required this.major,
    required this.time,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'major': major,
      'time': time,
      'year': year,
    };
  }
}
