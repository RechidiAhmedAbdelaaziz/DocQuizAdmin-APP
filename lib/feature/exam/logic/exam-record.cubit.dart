import 'package:admin_app/feature/exam/data/repo/exam.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exam-record.state.dart';


class ExamRecordCubit extends Cubit<ExamRecordState> {
  final ExamRepo _examRepo;

  ExamRecordCubit(this._examRepo) : super(ExamRecordState());

  Future<void> getExamRecords({
    major 
  }) async {
    
  }
}