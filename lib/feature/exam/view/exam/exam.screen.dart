import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/extension/to_time.extension.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/exam/data/models/create_exam.param.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/helper/create_exam.route.dart';
import 'package:admin_app/feature/exam/logic/exam.cubit.dart';
import 'package:admin_app/feature/question/helper/question.route.dart';
import 'package:admin_app/feature/question/helper/question_list.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'scaffold.dart';
part 'exam_list.dart';
part 'floatingbutton.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamCubit()..fetchExams(),
      child: _Scaffold(
        title: 'Exam',
        examList: const _ExamList(),
        floatingActionButton: const _FloatingButton(),
        listener: (context, state) {
          state.whenOrNull(
            error: (error) => context.showErrorSnackBar(error),
            examCreated: () =>
                context.showSuccessSnackBar('Exam created'),
            examUpdated: () =>
                context.showSuccessSnackBar('Exam updated'),
          );
        },
      ),
    );
  }
}
