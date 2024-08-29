import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/logic/exam.cubit.dart';
import 'package:admin_app/feature/levels/logic/course.cubit.dart';
import 'package:admin_app/feature/levels/logic/level.cubit.dart';
import 'package:admin_app/feature/levels/logic/major.cubit.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/module/question/logic/question.cubit.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin_app/core/extension/validator.extension.dart';

part 'scaffold.dart';
part 'question_text.dart';
part 'answers.dart';
part 'explanation.dart';
part 'input_field.widget.dart';
part 'difficulty.dart';
part 'source.dart';
part 'field.dart';
part 'save_button.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key, QuestionModel? question})
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
        questionText: const _QuestionText(),
        answers: const _Answers(),
        explanation: const _Explanation(),
        difficulty: const _Difficulty(),
        source: _SelectSource(_question?.source),
        field: _Field(_question?.field),
        saveButton: _SaveButton(_question ,),
      ),
    );
  }
}
