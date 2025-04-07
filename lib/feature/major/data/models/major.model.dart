import 'package:admin_app/core/shared/models/named.model.dart';

class MajorModel extends NamedModelBase {
  final bool? isOpen;
  const MajorModel({super.id, super.name, this.isOpen});

  factory MajorModel.fromJson(Map<String, dynamic> json) {
    return MajorModel(
      id: json['_id'],
      name: json['name'],
      isOpen: json['isOpen'] as bool?,
    );
  }
}
