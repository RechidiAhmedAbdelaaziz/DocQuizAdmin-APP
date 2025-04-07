import 'package:admin_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:admin_app/core/shared/dto/imagedto/image.dto.dart';
import 'package:admin_app/core/shared/widget/image_widget.dart';
import 'package:flutter/material.dart';



class ImageField extends StatelessWidget {
  final EditingController<ImageDTO> controller;
  final double? height;
  final double? width;
  final double? borderRadius;

  const ImageField({
    super.key,
    required this.controller,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      imageDto: controller.value,
      height: height,
      width: width,
      borderRadius: borderRadius,
      onPicked: (image) => controller.setValue(image),
      onEdited: (image) => controller.setValue(image),
      onDeleted: (image) => controller.clear(),
    );
  }
}
