import 'package:admin_app/core/shared/models/named.model.dart';

class DomainModel extends NamedModelBase {
  const DomainModel({
    super.id,
    super.name,
  });

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}
