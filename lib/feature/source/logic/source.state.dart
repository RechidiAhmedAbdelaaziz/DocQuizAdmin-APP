part of 'source.cubit.dart';

class SourceState {
  final List<SourceModel> sources;
  final String? error;

  SourceState({this.sources = const [], this.error});

  factory SourceState.initial() => SourceState();

  SourceState sourcesFetched(List<SourceModel> sources) =>
      SourceState(sources: sources);

  SourceState errorOccurred(String error) =>
      SourceState(error: error, sources: sources);

  SourceState sourceAdded(SourceModel source) {
    final newSources = List<SourceModel>.from(sources)
      ..addUniqe(source);
    return SourceState(sources: newSources);
  }

  SourceState sourceUpdated(SourceModel source) {
    sources[sources.indexOf(source)] = source;
    return SourceState(sources: sources);
  }

  SourceState sourceDeleted(SourceModel source) {
    final newSources = List<SourceModel>.from(sources)
      ..remove(source);
    return SourceState(sources: newSources);
  }

  void onError(Function(String) onError) {
    if (error != null) onError(error!);
  }
}
