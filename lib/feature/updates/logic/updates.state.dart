part of 'updtes.cubit.dart';

class UpdatesState {
  final List<UpdatesModel> updates;
  final String? _error;

  UpdatesState({
    required this.updates,
    String? error,
  }) : _error = error;

  factory UpdatesState.initial() => UpdatesState(updates: []);

  UpdatesState _fetchUpdates(List<UpdatesModel> updates) {
    return copyWith(updates: updates);
  }

  UpdatesState _addUpdate(UpdatesModel update) {
    return copyWith(updates: [...updates, update]);
  }

  UpdatesState _updateUpdate(UpdatesModel update) {
    updates[updates.indexOf(update)] = update;
    return copyWith(updates: updates);
  }

  UpdatesState _deleteUpdate(UpdatesModel update) {
    return copyWith(updates: updates..remove(update));
  }

  UpdatesState _setError(String error) {
    return copyWith(error: error);
  }

  UpdatesState copyWith({
    List<UpdatesModel>? updates,
    String? error,
  }) {
    return UpdatesState(
      updates: updates ?? this.updates,
      error: error,
    );
  }
}
