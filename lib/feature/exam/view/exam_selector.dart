import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/logic/exam.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamSelector extends StatelessWidget {
  const ExamSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamCubit()..fetchExams(),
      child: const _Selector(),
    );
  }
}

class _Selector extends StatelessWidget {
  const _Selector();

  @override
  Widget build(BuildContext context) {
    final exams = context.watch<ExamCubit>().exams;
    return PaginationBuilder(
      onFetch: context.read<ExamCubit>().fetchExams,
      builder: (loading) {
        return Column(
          children: [...exams.map((e) => _Item(e)), loading],
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.exam, {super.key});

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.back(exam),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: Text(exam.title!, style: TextStyle(fontSize: 18.sp)),
      ),
    );
  }
}
