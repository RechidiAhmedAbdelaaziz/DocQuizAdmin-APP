part of 'major.cubit.dart';

@freezed
class MajorState with _$MajorState {
  const factory MajorState.initial() = _Initial;

  const factory MajorState.addingMajor() = _AddingMajor;
  const factory MajorState.majorAdded() = _MajorAdded;

  const factory MajorState.fetchingMajors() = _FetchingMajors;
  const factory MajorState.majorsFetched() = _MajorsFetched;

  const factory MajorState.apiError(String message) = _ApiError;
}
