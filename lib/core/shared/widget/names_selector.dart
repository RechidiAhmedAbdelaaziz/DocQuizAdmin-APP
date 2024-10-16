import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/models/named.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NamesSelector<T extends NamedModelBase>
    extends StatelessWidget {
  const NamesSelector(
      {super.key, required this.items, this.onSelect});

  final List<T> items;
  final void Function(T)? onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Choiser un ${T.toString().split('Model')[0]}',
            style: TextStyle(fontSize: 24.sp),
          ),
          ...items.map(
            (course) => _Selector(
              course,
              onSelect: onSelect,
            ),
          )
        ],
      ),
    );
  }
}

class _Selector<T extends NamedModelBase> extends StatelessWidget {
  const _Selector(this.item, {this.onSelect});

  final T item;
  final void Function(T)? onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          onSelect == null ? context.back(item) : onSelect!(item),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: Text(item.name!, style: TextStyle(fontSize: 18.sp)),
      ),
    );
  }
}
