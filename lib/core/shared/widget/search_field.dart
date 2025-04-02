import 'dart:async';


import 'package:admin_app/core/shared/widget/input_field.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/icons.dart';
import 'package:flutter/material.dart';

/// Search field widget
/// Using timer to delay search to avoid multiple search requests

class AppSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String) onSearch;
  const AppSearchField({
    super.key,
    required this.controller,
    this.hintText = 'Search',
    required this.onSearch,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  Timer? _debounce;

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      widget.onSearch(value);
    });
  }

  @override
  void initState() {
    widget.controller.addListener(
      () => _onChanged(widget.controller.text),
    );
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      controller: widget.controller,
      hintText: widget.hintText,
      prefixIcon: AppIcons.search,
      keyboardType: TextInputType.text,
      fillColor: AppColors.white,
    );
  }
}
