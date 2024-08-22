import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/module/levels/data/models/level.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repo/level.repo.dart';

part 'level.state.dart';
part 'level.cubit.freezed.dart';

class LevelCubit extends Cubit<LevelState> {
  final _levelRepo = locator<LevelRepo>();

  LevelCubit() : super(const LevelState.initial());

  final List<LevelModel> _levels = [];

  List<LevelModel> get levels => _levels;

  Future<void> fetchLevels() async {
    emit(const LevelState.fetchingLevels());
    final result = await _levelRepo.getLevels();
    result.when(
      success: (data) {
        _levels.addAll(data);
        emit(const LevelState.levelsFetched());
      },
      failure: (error) => emit(LevelState.apiError(error.message)),
    );
  }

  Future<void> addLevel(String name) async {
    emit(const LevelState.creatingLevel());
    final result = await _levelRepo.createLevel(name: name);
    result.when(
      success: (data) {
        _levels.add(data);
        emit(const LevelState.levelCreated());
      },
      failure: (error) => emit(LevelState.apiError(error.message)),
    );
  }
}
