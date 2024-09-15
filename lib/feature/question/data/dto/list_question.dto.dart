import 'package:admin_app/core/shared/dto/pagination.dto.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';

class ListQuestionsFilter extends KeywordQuery {
  ListQuestionsFilter({
    super.keywords,
    super.page,
    super.limit = 10,
    this.types = const [],
    this.difficulties = const [],
    this.sources = const [],
    this.courses = const [],
    this.exam,
    this.years = const [],
    this.withExplanation = false,
  });

  final List<String> types;
  final List<String> difficulties;
  final List<SourceModel> sources;
  final List<CourseModel> courses;
  final ExamModel? exam;
  final List<String> years;
  final bool withExplanation;

  Map<String, dynamic> toQueryMap() {
    final query = super.toJson();

    if (types.isNotEmpty) query['types[]'] = types;
    if (difficulties.isNotEmpty) {
      query['difficulties[]'] = difficulties;
    }
    if (sources.isNotEmpty) {
      query['sources[]'] = sources.map((e) => e.id).toList();
    }
    if (courses.isNotEmpty) {
      query['courses[]'] = courses.map((e) => e.id).toList();
    }
    if (exam != null) query['examId'] = exam!.id;
    if (years.isNotEmpty) query['years[]'] = years;
    if (withExplanation) query['withExplanation'] = 'true';

    return query;
  }

  @override
  ListQuestionsFilter copyWith({
    String? keywords,
    int? page,
    int? limit,
    List<String>? types,
    List<String>? difficulties,
    List<SourceModel>? sources,
    List<CourseModel>? courses,
    ExamModel? exam,
    List<String>? years,
    bool? withExplanation,
  }) {
    return ListQuestionsFilter(
      keywords: keywords ?? this.keywords,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      types: types ?? this.types,
      difficulties: difficulties ?? this.difficulties,
      sources: sources ?? this.sources,
      courses: courses ?? this.courses,
      exam: exam ?? this.exam,
      years: years ?? this.years,
      withExplanation: withExplanation ?? this.withExplanation,
    );
  }
}
