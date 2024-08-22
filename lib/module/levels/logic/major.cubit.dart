import 'dart:io';

import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/module/levels/data/models/level.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repo/level.repo.dart';

part 'major.state.dart';
part 'major.cubit.freezed.dart';

class MajorCubit extends Cubit<MajorState> {
  final _levelRepo = locator<LevelRepo>();
  final String _level;

  MajorCubit(this._level) : super(const MajorState.initial());

  final List<MajorModel> _majors = [];

  List<MajorModel> get majors => _majors;

  Future<void> addMajor({
    required String name,
    required File? icon,
  }) async {
    emit(const MajorState.addingMajor());

    final result = await _levelRepo.addMajor(
      level: _level,
      name: name,
      icon: icon,
    );
    result.when(
      success: (data) {
        _majors.add(data);
        emit(const MajorState.majorAdded());
      },
      failure: (error) => emit(MajorState.apiError(error.message)),
    );
  }

  Future<void> fetchMajors() async {
    emit(const MajorState.fetchingMajors());
    final result = await _levelRepo.getMajors(level: _level);
    result.when(
      success: (data) {
        _majors.addAll(data);
        emit(const MajorState.majorsFetched());
      },
      failure: (error) => emit(MajorState.apiError(error.message)),
    );
  }
}
