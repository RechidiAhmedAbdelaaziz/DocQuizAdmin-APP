import 'package:admin_app/core/extension/dropdown.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/to_time.extension.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/exam/data/models/create_exam.param.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin_app/core/extension/validator.extension.dart';

part 'scaffold.dart';
part 'form.dart';
part 'reset_button.dart';
part 'save_button.dart';

class CreateExamScreen extends StatelessWidget {
  CreateExamScreen({super.key, ExamModel? exam}) {
    if (exam != null) {
      _cityController.text = exam.city;
      _majorController.text = exam.major;
      _yearController.text = exam.year.toString();
      _houreController.text =
          exam.time!.toTimeHourMinuteSecond.split(':')[0];
      _minuteController.text =
          exam.time!.toTimeHourMinuteSecond.split(':')[1];
    }
  }

  final _cityController = TextEditingController();
  final _majorController = TextEditingController();
  final _yearController = TextEditingController();
  final _houreController = TextEditingController();
  final _minuteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      form: _Form(
        _formKey,
        _cityController,
        _majorController,
        _yearController,
        _houreController,
        _minuteController,
      ),
      resetButton: _ResetButton(),
      saveButton: _SaveButton(
        _formKey,
        _cityController,
        _majorController,
        _yearController,
        _houreController,
        _minuteController,
      ),
    );
  }
}
