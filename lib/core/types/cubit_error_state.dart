import 'package:equatable/equatable.dart';

abstract class CubitErrorState extends Equatable {
  final String? _error;

  CubitErrorState(String? error) : _error = error;

  void onError(void Function(String error) callback) {
    if (_error != null) {
      callback(_error);
    }
  }


}
