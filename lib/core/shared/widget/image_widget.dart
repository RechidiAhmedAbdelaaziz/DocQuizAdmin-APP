import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/services/filepicker/filepick.service.dart';
import 'package:admin_app/core/shared/dto/imagedto/image.dto.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ImageWidget extends StatefulWidget {
  final ImageDTO? imageDto;

  final double? height;
  final double? width;
  final double? borderRadius;

  final ValueChanged<ImageDTO> onPicked;
  final ValueChanged<ImageDTO>? onEdited;
  final ValueChanged<ImageDTO>? onDeleted;

  const ImageWidget({
    super.key,
    this.imageDto,
    this.height,
    this.width,
    this.borderRadius,
    required this.onPicked,
    this.onDeleted,
    this.onEdited,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  ImageDTO? _imageDTO;

  @override
  void initState() {
    _imageDTO = widget.imageDto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPicked = _imageDTO != null;
    return Container(
      // height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
        // image: isPicked
        //     ? DecorationImage(
        //         image: _imageDTO!.image,
        //         fit: BoxFit.contain,
        //       )
        //     : null,
      ),
      child: !isPicked
          ? IconButton(
              icon: Icon(Icons.add_a_photo, color: AppColors.black),
              onPressed: () => _uploadImage(widget.onPicked),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                WidgetZoom(
                  heroAnimationTag: 'zoom',
                  zoomWidget: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? 0,
                    ),
                    child: Image(
                      image: _imageDTO!.image,
                      // fit: BoxFit.cover,
                      // height: widget.height,
                      // width: widget.width,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.onDeleted != null)
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              widget.onDeleted?.call(_imageDTO!);
                              setState(() => _imageDTO = null);
                            },
                          ),
                        ),
                      widthSpace(4),
                      if (widget.onEdited != null)
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () =>
                                _uploadImage(widget.onEdited!),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _uploadImage(ValueChanged<ImageDTO> onPicked) async {
    final image = await locator<ImagePickerService>().pickFile();
    if (image != null) {
      onPicked(image);
      setState(() => _imageDTO = image);
    }
  }
}
