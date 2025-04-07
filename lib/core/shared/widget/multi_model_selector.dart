import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiModelSelector<T> extends StatelessWidget {
  final ListEditingController<T> controller;
  final String title;
  final Widget Function(BuildContext context, List<T> models)
      itemsBuilder;
  final Widget Function() selector;
  final bool isRequired;

  const MultiModelSelector({
    super.key,
    required this.controller,
    required this.title,
    required this.itemsBuilder,
    required this.selector,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    // we can add items to the list , also remove them
    return FormField(
      validator: (_) => (isRequired && controller.value.isEmpty)
          ? 'Ce champ est requis'
          : null,
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: title,
                    children: [
                      TextSpan(
                        text: isRequired ? ' *' : '',
                        style: AppTextStyles.large.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  style: AppTextStyles.large.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _addModel(context),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) =>
                  value?.isEmpty == true
                      ? Text(
                          'Aucun $title ajouté',
                          style: AppTextStyles.small.copyWith(
                            color: Colors.grey[600],
                          ),
                        )
                      : itemsBuilder(context, value ?? []),
            ),
          ),
          heightSpace(4),
          if (state.hasError)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widthSpace(8),
                Icon(
                  Icons.error_outline,
                  color: AppColors.red,
                  size: 20.r,
                ),
                widthSpace(8),
                Expanded(
                  child: Text(
                    state.errorText!,
                    style: AppTextStyles.error,
                  ),
                ),
                widthSpace(8),
              ],
            ),
        ],
      ),
    );
  }

  void _addModel(BuildContext context) {
    context.dialogWith<T>(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 32.h,
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.grey),
        ),
        child: selector(),
      ),
      onResult: controller.addValue,
    );
  }
}
