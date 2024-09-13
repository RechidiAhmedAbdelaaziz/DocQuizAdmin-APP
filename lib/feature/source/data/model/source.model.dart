import 'package:admin_app/core/shared/models/named.model.dart';

class SourceModel extends NamedModelBase {
  const SourceModel({super.id, super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['_id'],
      name: json['title'],
    );
  }

  @override
  List<Object?> get props => [id];
}
