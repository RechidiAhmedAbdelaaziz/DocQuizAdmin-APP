import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/core/shared/dto/pagination.dto.dart';
import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';

class ListQuestionsFilter extends KeywordQuery {
  ListQuestionsFilter({
    super.keywords,
    super.page,
    super.limit = 10,
    List<String>? types,
    List<String>? difficulties,
    List<SourceModel>? sources,
    List<CourseModel>? courses,
    List<String>? years,
    this.exam,
    this.withExplanation = false,
    this.withoutExplanation = false,
    this.keyword,
  })  : types = types ?? [],
        difficulties = difficulties ?? [],
        sources = sources ?? [],
        courses = courses ?? [],
        years = years ?? [];

  final List<String> types;
  final List<String> difficulties;
  final List<SourceModel> sources;
  final List<CourseModel> courses;
  final ExamModel? exam;
  final List<String> years;
  final bool withExplanation;
  final bool withoutExplanation;
  final String? keyword;

  Map<String, dynamic> toQueryMap() {
    final query = super.toJson();

    if (types.isNotEmpty) query['types[]'] = types;
    if (difficulties.isNotEmpty) {
      query['difficulties[]'] =
          difficulties.map((e) => e.toLowerCase()).toList();
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
    if (withoutExplanation) query['withoutExplanation'] = 'true';
    if (keyword != null) query['keywords'] = keyword;
    if (years.isNotEmpty) {
      query['years[]'] = years.map((e) => int.parse(e)).toList();
    }

    return query;
  }

  @override
  ListQuestionsFilter copyWith({
    String? keywords,
    int? page,
    int? limit,
    String? type,
    String? difficultie,
    List<SourceModel>? sources,
    List<CourseModel>? courses,
    ExamModel? exam,
    String? year,
    bool? withExplanation,
    bool? withoutExplanation,
    String? keyword,
  }) {
    if (type != null) types.addOrRemove(type);
    if (difficultie != null) difficulties.addOrRemove(difficultie);
    if (year != null) years.addOrRemove(year);

    return ListQuestionsFilter(
      keywords: keywords ?? this.keywords,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      types: types,
      difficulties: difficulties,
      sources: sources ?? this.sources,
      courses: courses ?? this.courses,
      exam: exam ?? this.exam,
      years: years,
      withExplanation: withExplanation ?? this.withExplanation,
      withoutExplanation:
          withoutExplanation ?? this.withoutExplanation,
      keyword: keyword ?? this.keyword,
    );
  }
}
