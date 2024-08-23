import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/module/exam/data/models/exam.model.dart';
import 'package:admin_app/module/exam/data/repo/exam.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.state.dart';
part 'exam_cubit.freezed.dart';

class ExamCubit extends Cubit<ExamState> {
  final _examRepo = locator<ExamRepo>();

  ExamCubit() : super(const ExamState.initial());

  final List<ExamModel> _exams = [];
  int _page = 1;

  Future<void> fetchExams() async {
    emit(const ExamState.fetchingExams());

    final result = await _examRepo.getExams(page: _page);

    result.when(
      success: (exams) {
        if (exams.isNotEmpty) {
          _exams.addAllUniq(exams);
          _page++;
        }
        emit(const ExamState.fetchedExams());
      },
      failure: (error) {
        emit(ExamState.error(error.message));
      },
    );
  }

  Future<void> createExam({
    required String major,
    required int time,
    required int year,
    required String city,
  }) async {
    emit(const ExamState.examCreating());

    final result = await _examRepo.createExam(
      major: major,
      time: time,
      year: year,
      city: city,
    );

    result.when(
      success: (exam) {
        _exams.addUniq(exam);
        emit(const ExamState.examCreated());
      },
      failure: (error) {
        emit(ExamState.error(error.message));
      },
    );
  }
}
