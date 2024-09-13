import 'package:admin_app/core/shared/models/named.model.dart';

class LevelModel extends NamedModelBase {
  const LevelModel({
    super.id,
    super.name,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}
