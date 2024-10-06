import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/updates/data/model/updates.model.dart';
import 'package:admin_app/feature/updates/data/repo/updates.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'updates.state.dart';

class UpdatesCubit extends Cubit<UpdatesState> {
  final _apiRepo = locator<UpdatesRepo>();
  UpdatesCubit() : super(UpdatesState.initial());

  void fetchUpdates() async {
    final result = await _apiRepo.getUpdates();
    result.when(
      success: (updates) => emit(state._fetchUpdates(updates)),
      error: (error) => emit(state._setError(error.message)),
    );
  }

  void addUpdate({
    required String title,
    required String description,
  }) async {
    final result = await _apiRepo.createUpdate(
      title: title,
      description: description,
    );
    result.when(
      success: (update) => emit(state._addUpdate(update)),
      error: (error) => emit(state._setError(error.message)),
    );
  }

  void updateUpdate(UpdatesModel update) async {
    final result = await _apiRepo.updateUpdate(
      update.id,
      title: update.title,
      description: update.description,
    );
    result.when(
      success: (update) => emit(state._updateUpdate(update)),
      error: (error) => emit(state._setError(error.message)),
    );
  }

  void deleteUpdate(UpdatesModel update) async {
    final result = await _apiRepo.deleteUpdate(update.id);
    result.when(
      success: (_) => emit(state._deleteUpdate(update)),
      error: (error) => emit(state._setError(error.message)),
    );
  }
}
