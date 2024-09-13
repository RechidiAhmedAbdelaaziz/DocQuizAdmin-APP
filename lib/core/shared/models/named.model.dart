import 'package:equatable/equatable.dart';

abstract class NamedModelBase extends Equatable {
  final String? id;
  final String? name;

  const NamedModelBase({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id];
}
