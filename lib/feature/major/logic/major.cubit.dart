import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/major/data/repo/major.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/major.model.dart';

part 'major.state.dart';

class MajorCubit extends Cubit<MajorState> {
  final _majorRepo = locator<MajorRepo>();
  final LevelModel level;

  MajorCubit(this.level) : super(MajorState.initial());

  Future<void> getMajors() async {
    final result = await _majorRepo.getMajors(levelId: level.id!);
    result.when(
      success: (majors) => emit(state.fetchMajors(majors)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> addMajor(String name) async {
    final result = await _majorRepo.createMajor(
        levelId: level.id!, name: name);
    result.when(
      success: (major) => emit(state.addMajor(major)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> updateMajor(
      MajorModel major, String name) async {
    final result = await _majorRepo.updateMajor(major.id!,
        name: name);
    result.when(
      success: (major) => emit(state.updateMajor(major)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> deleteMajor(MajorModel major) async {
    final result = await _majorRepo.deleteMajor(major.id!);
    result.when(
      success: (_) => emit(state.deleteMajor(major)),
      error: (error) => emit(state.setError(error.message)),
    );
  }
}
