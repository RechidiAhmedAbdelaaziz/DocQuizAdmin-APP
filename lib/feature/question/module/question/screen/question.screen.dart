import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/logic/question.cubit.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin_app/core/extension/validator.extension.dart';

part 'scaffold.dart';
part 'question_text.dart';
// part 'answers.dart';
part 'explanation.dart';
part 'input_field.widget.dart';
part 'difficulty.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, QuestionModel? question})
      : _question = question;

  final QuestionModel? _question;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(
        questionListCubit: context.read<QuestionListCubit>(),
        question: _question,
      ),
      child: _Scaffold(
        questionText: _QuestionText(),
        answers: Text('Answers'),
        explanation: _Explanation(),
        difficulty: _Difficulty(),
        source: Text('Source'),
        field: Text('Field'),
        saveButton: Text('Save'),
      ),
    );
  }
}
