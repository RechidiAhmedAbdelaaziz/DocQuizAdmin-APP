import 'package:admin_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputeField extends StatefulWidget {
  const AppInputeField({
    super.key,
    String? hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
  })  : _hint = hint,
        _controller = controller,
        _keyboardType = keyboardType,
        _obscureText = obscureText,
        _onChanged = onChanged,
        _validator = validator;

  final String? _hint;
  final TextEditingController _controller;
  final TextInputType _keyboardType;
  final bool _obscureText;
  final void Function(String)? _onChanged;
  final String? Function(String?)? _validator;

  @override
  _AppInputeFieldState createState() => _AppInputeFieldState();
}

class _AppInputeFieldState extends State<AppInputeField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      keyboardType: widget._keyboardType,
      obscureText: widget._obscureText && !_showPassword,
      onChanged: widget._onChanged,
      validator: widget._validator,
      decoration: InputDecoration(
        hintText: widget._hint,
        hintStyle: TextStyle(
          color: AppColors.warmGrey,
          fontSize: 18.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.silver),
        ),
        isDense: true,
        isCollapsed: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        suffixIcon: widget._obscureText
            ? IconButton(
                icon: Icon(
                  _showPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.warmGrey,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null,
      ),
    );
  }
}
