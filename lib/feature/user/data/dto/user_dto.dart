import 'package:admin_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:admin_app/core/shared/dto/form_dto.dart';
import 'package:admin_app/feature/auth/data/models/user.model.dart';
import 'package:flutter/material.dart';

class UserDto extends FormDTO {
  final TextEditingController emailController;
  final EditingController<String> roleController;

  UserDto([UserModel? user])
      : emailController = TextEditingController(text: user?.email),
        roleController = EditingController<String>(user?.role);

  @override
  void dispose() {
    emailController.dispose();
    roleController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'userEmail': emailController.text,
      'role': roleController.value,
    };
  }
}
