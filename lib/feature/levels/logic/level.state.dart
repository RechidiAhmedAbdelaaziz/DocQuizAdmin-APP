part of 'level.cubit.dart';

@freezed
class LevelState with _$LevelState {
  const factory LevelState.initial() = _Initial;

  const factory LevelState.fetchingLevels() = _FetchingLevels;
  const factory LevelState.levelsFetched() = _LevelsFetched;

  const factory LevelState.creatingLevel() = _CreatingLevel;
  const factory LevelState.levelCreated() = _LevelCreated;

  const factory LevelState.apiError(String error) = _Error;
}
