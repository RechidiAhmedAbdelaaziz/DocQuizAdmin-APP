part of 'question.screen.dart';

class _InputeField extends StatelessWidget {
  const _InputeField({
    required String title,
    required String hintText,
    required String? initialValue,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  })  : _title = title,
        _hintText = hintText,
        _initialValue = initialValue,
        _onChanged = onChanged,
        _validator = validator;

  final String _title;
  final String _hintText;
  final String? _initialValue;
  final Function(String) _onChanged;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' $_title',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        height(8),
        TextFormField(
          initialValue: _initialValue,
          onChanged: _onChanged,
          validator: _validator,
          decoration: InputDecoration(
            hintText: _hintText,
            border: const OutlineInputBorder(),
          ),
          maxLines: null,
        ),
      ],
    );
  }
}
