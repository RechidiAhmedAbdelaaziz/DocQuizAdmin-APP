part of 'create_exam.screen.dart';

class _SaveButton extends StatelessWidget {
  const _SaveButton(
    this._formKey,
    this._cityController,
    this._majorController,
    this._yearController,
    this._houreController,
    this._minuteController,
  );

  final GlobalKey<FormState> _formKey;

  final TextEditingController _cityController;
  final TextEditingController _majorController;
  final TextEditingController _yearController;
  final TextEditingController _houreController;
  final TextEditingController _minuteController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState?.validate() == true) {
          context.back<CreateExamParam>(CreateExamParam(
            city: _cityController.text,
            major: _majorController.text,
            year: int.parse(_yearController.text),
            time: int.parse(_houreController.text) * 3600 +
                int.parse(_minuteController.text) * 60,
          ));
        }
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        width: 320.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
