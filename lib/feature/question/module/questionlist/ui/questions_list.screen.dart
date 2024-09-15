import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/helper/question.route.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsListScreen extends StatelessWidget {
  const QuestionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questions =
        context.watch<QuestionListCubit>().state.questions;
    final cubit = context.read<QuestionListCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: PaginationBuilder(
        onFetch: context.read<QuestionListCubit>().fetchQuestions,
        builder: (loadingWidget) => Column(
          children: [
            ...questions.map((question) => _QuestionItem(question)),
            loadingWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.to<QuestionModel>(QuestionRoute.create()).then(
                (value) =>
                    value != null ? cubit.onAddQuestion(value) : null,
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _QuestionItem extends StatelessWidget {
  final QuestionModel question;

  const _QuestionItem(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildHint(
                    value: question.exam?.title, color: Colors.teal),
              ),
              _buildOption(),
            ],
          ),
          const Divider(),
          Text(
            '  ${question.questionText!}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(),
          Row(
            children: [
              _buildHint(
                value: question.difficulty == 'easy'
                    ? 'Facile'
                    : question.difficulty == 'medium'
                        ? 'Moyen'
                        : 'Difficile',
                color: question.difficulty == 'easy'
                    ? Colors.green
                    : question.difficulty == 'medium'
                        ? Colors.orange
                        : Colors.red,
              ),
              width(20),
              _buildHint(
                value: question.type,
                color: Colors.blue,
              ),
              const Spacer(),
              _buildHint(
                value: question.explanation?.isEmpty == true
                    ? null
                    : 'Has Explanation',
                color: Colors.purple,
              ),
            ],
          ),
          _buildValue(title: 'Cours: ', value: question.course?.name),
          _buildValue(
              title: 'Source: ', value: question.source?.name),
        ],
      ),
    );
  }

  Widget _buildValue({
    required String title,
    required String? value,
  }) {
    return value == null
        ? const SizedBox.shrink()
        : Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildHint({
    required String? value,
    required Color color,
  }) {
    return value == null
        ? const SizedBox.shrink()
        : Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1.3,
              ),
            ),
          );
  }

  Widget _buildOption() {
    return PopupMenuButton(
      itemBuilder: (context) {
        final cubit = context.read<QuestionListCubit>();
        void back() => context.back();
        return [
          PopupMenuItem(
            child: ListTile(
              title: const Text('Modifier'),
              leading: const Icon(Icons.edit),
              onTap: () async {
                final newQuestion = await context
                    .to<QuestionModel>(QuestionRoute.edit(question));

                if (newQuestion != null) {
                  cubit.onUpdateQuestion(newQuestion);
                }
                back();
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: const Text('Supprimer'),
              leading: const Icon(Icons.delete),
              onTap: () {
                context.read<QuestionListCubit>().delete(question);
                context.back();
              },
            ),
          ),
        ];
      },
    );
  }
}
