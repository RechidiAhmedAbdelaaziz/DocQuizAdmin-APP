import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/extension/to_time.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/exam/data/models/create_exam.param.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/exam/helper/create_exam.route.dart';
import 'package:admin_app/feature/exam/logic/exam.cubit.dart';
import 'package:admin_app/feature/question/helper/question.route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExamCubit>();
    return BlocListener<ExamCubit, ExamState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            context.showErrorSnackBar(message);
          },
          examCreated: () {
            context.showSuccessSnackBar('Examen créé avec succès');
          },
          examUpdated: () {
            context.showSuccessSnackBar('Examen modifié avec succès');
          },
          examDeleted: () {
            context
                .showSuccessSnackBar('Examen supprimé avec succès');
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Examens'),
        ),
        body: Column(
          children: [
            // search bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 8.h),
              child: TextField(
                onSubmitted: cubit.setSearch,
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PaginationBuilder(
                onFetch: cubit.fetchExams,
                builder: (loading) {
                  return Column(
                    children: [
                      ...cubit.exams.map((e) => _ExamItem(e)),
                      loading,
                      height(30.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        //add button
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final details =
                await context.to<CreateExamParam>(CreateExamRoute());
            if (details != null) {
              cubit.createExam(details: details);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _ExamItem extends StatelessWidget {
  const _ExamItem(this.exam);

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();
    return InkWell(
      onTap: () {
        context.to(QuestionListRoute.ofExam(exam));
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height(8),
                  Row(
                    children: [
                      Icon(
                        Icons.quiz,
                        size: 20.spMin,
                      ),
                      width(4),
                      Text(
                        exam.questions.toString(),
                        style: TextStyle(
                          fontSize: 18.spMin,
                        ),
                      ),
                      width(25),
                      Icon(
                        Icons.timer,
                        size: 20.spMin,
                      ),
                      width(4),
                      Text(
                        (exam.time ?? 0).toTimeHourMinuteSecond,
                        style: TextStyle(
                          fontSize: 18.spMin,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.showDialogBox(
                  title: 'Supprimer examen',
                  body: 'Voulez-vous vraiment supprimer cet examen?',
                  confirmText: 'Supprimer',
                  onConfirm: (back) {
                    cubit.deleteExam(exam);
                    back();
                  },
                  cancelText: 'Annuler',
                  onCancel: (back) => back(),
                );
              },
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () async {
                final details = await context
                    .to<CreateExamParam>(CreateExamRoute(exam: exam));
                if (details != null) {
                  cubit.updateExam(exam, details: details);
                }
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
