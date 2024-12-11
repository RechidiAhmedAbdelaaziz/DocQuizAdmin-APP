import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DropDowns on BuildContext {
  Widget showSingleItemDropDown({
    required List<String> data,
    required TextEditingController controller,
    String? hintText,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        validator: validator,
        onTap: () {
          DropDownState(
            DropDown(
              data: data
                  .map((e) => SelectedListItem(name: e, value: e))
                  .toList(),
              onSelected: (list) {
                onChanged?.call(list.first.name);
                controller.text = list.first.name;
              },
            ),
          ).showModal(this);
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          // suffixIcon: const Icon(Icons.arrow_drop_down),

          contentPadding:
              EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          hintText: hintText,
          labelText: hintText,
          alignLabelWithHint: true,

          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget showMultiItemDropDown({
    required List<String> data,
    required TextEditingController controller,
    String? hintText,
    int? maxSelected,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        maxLines: null,
        onTap: () {
          DropDownState(
            DropDown(
              maxSelectedItems: maxSelected,
              enableMultipleSelection: true,
              data: data
                  .map((e) => SelectedListItem(
                        name: e,
                        value: e,
                        isSelected: controller.text.contains(e),
                      ))
                  .toList(),
              onSelected: (list) {
                controller.text = list.map((e) => e.name).join(', ');
              },
            ),
          ).showModal(this);
        },
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          hintText: hintText,
          labelText: hintText,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
