import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/home/data/models/statistique.model.dart';
import 'package:admin_app/feature/home/data/repo/home.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final _homeRepo = locator<HomeRepo>();
  HomeCubit() : super(const HomeState.initial());

  final _statistics = StatisticsModel();

  StatisticsModel get statistics => _statistics;

  Future<void> fetchStatistics() async {
    emit(const HomeState.loading());
    final result = await _homeRepo.getStatistique();

    result.when(
      success: (statistic) {
        _statistics.copyWith(statistic);
        emit(const HomeState.loaded());
      },
      error: (error) => emit(HomeState.error(error.message)),
    );
  }
}
