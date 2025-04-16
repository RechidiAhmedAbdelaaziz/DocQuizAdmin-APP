import 'package:admin_app/core/shared/models/named.model.dart';

class MajorModel extends NamedModelBase {
  const MajorModel({super.id, super.name});

  factory MajorModel.fromJson(Map<String, dynamic> json) {
    return MajorModel(
      id: json['_id'],
      name: json['name'],
     
    );
  }
}
