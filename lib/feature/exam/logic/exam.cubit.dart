import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/feature/exam/data/models/create_exam.param.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/data/repo/exam.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.state.dart';
part 'exam.cubit.freezed.dart';

class ExamCubit extends Cubit<ExamState> {
  final _examRepo = locator<ExamRepo>();

  ExamCubit() : super(const ExamState.initial());

  final List<ExamModel> _exams = [];
  int _page = 1;

  List<ExamModel> get exams => _exams;

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
    required CreateExamParam details,
  }) async {
    emit(const ExamState.examCreating());

    final result = await _examRepo.createExam(details);

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

  Future<void> updateExam(
    ExamModel exam, {
    String? major,
    int? time,
    int? year,
    String? city,
  }) async {
    emit(const ExamState.examUpdating());

    final result = await _examRepo.updateExam(
      exam.id!,
      major: major,
      time: time,
      year: year,
      city: city,
    );

    result.when(
      success: (newExam) {
        _exams[_exams.indexOf(exam)] = newExam;
        emit(const ExamState.examUpdated());
      },
      failure: (error) {
        emit(ExamState.error(error.message));
      },
    );
  }
}
