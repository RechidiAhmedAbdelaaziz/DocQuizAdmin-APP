part of 'level.cubit.dart';

class LevelState {
  final List<LevelModel> levels;
  final String? error;

  LevelState({this.levels = const [], this.error});

  factory LevelState.initial() => LevelState();

  LevelState fetchLevels(List<LevelModel> levels) =>
      LevelState(levels: levels);

  LevelState addLevel(LevelModel level) =>
      LevelState(levels: [...levels, level]);

  LevelState updateLevel(LevelModel level) {
    levels[levels.indexOf(level)] = level;
    return LevelState(levels: levels);
  }

  LevelState deleteLevel(LevelModel level) {
    levels.remove(level);
    return LevelState(levels: levels);
  }

  LevelState setError(String error) =>
      LevelState(error: error, levels: levels);

  void onError(Function(String) onError) {
    if (error != null) onError(error!);
  }
}
