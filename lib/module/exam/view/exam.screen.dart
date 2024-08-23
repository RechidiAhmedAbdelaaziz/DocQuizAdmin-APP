import 'package:admin_app/core/extension/to_time.extension.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/module/exam/data/models/exam.model.dart';
import 'package:admin_app/module/exam/logic/exam.cubit.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
