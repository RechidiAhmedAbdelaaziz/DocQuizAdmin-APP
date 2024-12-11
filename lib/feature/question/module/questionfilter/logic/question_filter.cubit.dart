import 'package:admin_app/feature/course/data/models/course.model.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_filter.state.dart';

class QuestionFilterCubit extends Cubit<QuestionFilterState> {
  QuestionFilterCubit({
    SourceModel? source,
    CourseModel? course,
    ExamModel? exam,
  }) : super(QuestionFilterState.initial(
          source: source,
          course: course,
          exam: exam,
        ));
  

  final searchController = TextEditingController();

  void selectYear(String year) => emit(state.selectYear(year));

  void setKeyword(String keyword) => emit(state.setKeyword(keyword));

  void selectType(String type) => emit(state.selectType(type));

  void selectDifficulty(String difficulty) =>
      emit(state.selectDifficulty(difficulty));

  void setWithExplanation(bool withExplanation) =>
      emit(state.setWithExplanation(withExplanation));
}
