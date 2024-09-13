import 'package:admin_app/core/shared/models/named.model.dart';

class CourseModel extends NamedModelBase {
  const CourseModel({
    super.id,
    super.name,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}
