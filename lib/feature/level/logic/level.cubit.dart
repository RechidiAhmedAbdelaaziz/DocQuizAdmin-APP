import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/level/data/repo/level.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/level.model.dart';

part 'level.state.dart';

class LevelCubit extends Cubit<LevelState> {
  final _levelRepo = locator<LevelRepo>();
  final DomainModel domain;

  LevelCubit(this.domain) : super(LevelState.initial());

  Future<void> getLevels() async {
    final result = await _levelRepo.getLevels(domainId: domain.id!);
    result.when(
      success: (levels) => emit(state.fetchLevels(levels)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> addLevel(String name) async {
    final result = await _levelRepo.createLevel(
        domainId: domain.id!, name: name);
    result.when(
      success: (level) => emit(state.addLevel(level)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> updateLevel(LevelModel level, String name) async {
    final result =
        await _levelRepo.updateLevel(level.id!, name: name);
    result.when(
      success: (level) => emit(state.updateLevel(level)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> deleteLevel(LevelModel level) async {
    final result = await _levelRepo.deleteLevel(level.id!);
    result.when(
      success: (_) => emit(state.deleteLevel(level)),
      error: (error) => emit(state.setError(error.message)),
    );
  }
}
