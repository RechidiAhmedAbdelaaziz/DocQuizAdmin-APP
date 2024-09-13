import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/feature/source/data/model/source.model.dart';
import 'package:admin_app/feature/source/data/repo/source.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'source.state.dart';

class SourceCubit extends Cubit<SourceState> {
  final _sourceRepo = locator<SourceRepo>();
  SourceCubit() : super(SourceState.initial());

  Future<void> getSources() async {
    final result = await _sourceRepo.getSources();

    result.when(
      success: (sources) => emit(state.sourcesFetched(sources)),
      error: (error) => emit(state.errorOccurred(error.message)),
    );
  }

  Future<void> addSource(String title) async {
    final result = await _sourceRepo.createSource(title: title);

    result.when(
      success: (source) => emit(state.sourceAdded(source)),
      error: (error) => emit(state.errorOccurred(error.message)),
    );
  }

  Future<void> updateSource(SourceModel source, String title) async {
    final result =
        await _sourceRepo.updateSource(source.id!, title: title);

    result.when(
      success: (source) => emit(state.sourceUpdated(source)),
      error: (error) => emit(state.errorOccurred(error.message)),
    );
  }

  Future<void> deleteSource(SourceModel source) async {
    final result = await _sourceRepo.deleteSource( source.id!);

    result.when(
      success: (_) => emit(state.sourceDeleted(source)),
      error: (error) => emit(state.errorOccurred(error.message)),
    );
  }
}
