import 'package:admin_app/core/shared/models/named.model.dart';

class CourseModel extends NamedModelBase {
  final bool isOpen;
  const CourseModel({
    super.id,
    super.name,
    this.isOpen = false,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'],
      name: json['name'],
      isOpen: json['isOpen'] ?? false,
    );
  }
}
