import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModelSelector<T> extends StatelessWidget {
  final EditingController<T> controller;
  final String title;
  final Widget Function(BuildContext context, T model) itemBuilder;
  final Widget selector;
  final bool isRequired;

  const ModelSelector({
    super.key,
    required this.controller,
    required this.title,
    required this.itemBuilder,
    required this.selector,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) => (isRequired && controller.value == null)
          ? 'Ce champ est requis'
          : null,
      builder: (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
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
            heightSpace(12),
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                return value == null
                    ? _buildSelector(context)
                    : Row(
                        children: [
                          itemBuilder(context, value),
                          if (!isRequired)
                            IconButton(
                              onPressed: controller.clear,
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.red,
                              ),
                            ),
                        ],
                      );
              },
            ),
            heightSpace(4),
            if (state.hasError)
              Text(
                state.errorText ?? '',
                style: AppTextStyles.medium.copyWith(
                  color: AppColors.red,
                ),
              ),
          ]),
    );
  }

  Widget _buildSelector(BuildContext context) {
    return InkWell(
      onTap: () => context.dialogWithResult<T>(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.grey),
          ),
          child: selector,
        ),
        onResult: controller.setValue,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sélectionner',
              style: AppTextStyles.medium.copyWith(
                color: AppColors.grey,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
