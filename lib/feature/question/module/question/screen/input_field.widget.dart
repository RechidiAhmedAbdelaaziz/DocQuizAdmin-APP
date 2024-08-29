part of 'question.screen.dart';

class _InputeField extends StatelessWidget {
  _InputeField({
    String? title,
    TextEditingController? controller,
    required String hintText,
    required String? initialValue,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  })  : _title = title,
        _hintText = hintText,
        _onChanged = onChanged,
        _validator = validator,
        _controller = controller ?? TextEditingController() {
    _controller.text = initialValue ?? '';
  }

  final String? _title;
  final String _hintText;
  final Function(String) _onChanged;
  final String? Function(String?)? _validator;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_title != null)
          Text(
            ' $_title',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        height(8),
        TextFormField(
          controller: _controller,
          onChanged: (value) {
            _controller.text = value;
            _onChanged(value);
          },
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
