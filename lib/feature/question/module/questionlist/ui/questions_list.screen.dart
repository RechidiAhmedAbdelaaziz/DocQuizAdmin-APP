import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:admin_app/feature/question/helper/question.route.dart';
import 'package:admin_app/feature/question/module/questionfilter/logic/question_filter.cubit.dart';
import 'package:admin_app/feature/question/module/questionfilter/ui/question_filter.dart';
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
      appBar: AppBar(
        title: const Text('Questions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () async {
              final filters =
                  await context.showBottomSheet<ListQuestionsFilter>(
                      child: BlocProvider.value(
                value: context.read<QuestionFilterCubit>(),
                child: const QuestionFilter(),
              ));

              if (filters != null) cubit.setFilters = filters;
            },
          ),
        ],
      ),
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

// class _QuestionItem extends StatelessWidget {
//   final QuestionModel question_;

//   const _QuestionItem(this.question_);

//   @override
//   Widget build(BuildContext context) {
//     final question = question_.questions!.first;

//     return Text('Question is ${question.text}');

//     if (question_.questions == null || question_.questions!.isEmpty) {
//       return Text('RECHIID');
//     }
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
//       padding: EdgeInsets.all(10.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: _buildHint(
//                   value: question_.exams?.first.title,
//                   color: Colors.teal,
//                 ),
//               ),
//               _buildOption(),
//             ],
//           ),
//           const Divider(),
//           Text(
//             '  ${question_.caseText ?? question.text}  ',
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 22.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const Divider(),
//           Row(
//             children: [
//               _buildHint(
//                 value: question.difficulty == 'easy'
//                     ? 'Facile'
//                     : question.difficulty == 'medium'
//                         ? 'Moyen'
//                         : 'Difficile',
//                 color: question.difficulty == 'easy'
//                     ? Colors.green
//                     : question.difficulty == 'medium'
//                         ? Colors.orange
//                         : Colors.red,
//               ),
//               width(20),
//               _buildHint(
//                 value: question_.type,
//                 color: question_.type?.toLowerCase() == 'cas clinique'
//                     ? Colors.blue
//                     : Colors.teal,
//               ),
//               const Spacer(),
//               _buildHint(
//                 value: question_.withExplanation == true
//                     ? 'Has Explanation'
//                     : null,
//                 color: Colors.purple,
//               ),
//             ],
//           ),
//           _buildValue(
//               title: 'Cours: ', value: question_.course?.name),
//           _buildValue(
//             title: 'Source: ',
//             value: question_.sources
//                 .map((e) => '${e.source?.name} | ${e.year}')
//                 .join(', '),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildValue({
//     required String title,
//     required String? value,
//   }) {
//     return value == null
//         ? const SizedBox.shrink()
//         : Container(
//             margin: EdgeInsets.symmetric(vertical: 5.h),
//             padding:
//                 EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//             decoration: BoxDecoration(
//               color: Colors.amber[100],
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     value,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18.sp,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }

//   Widget _buildHint({
//     required String? value,
//     required Color color,
//   }) {
//     return value == null
//         ? const SizedBox.shrink()
//         : Container(
//             margin: EdgeInsets.symmetric(vertical: 5.h),
//             padding:
//                 EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Text(
//               value,
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: Colors.white,
//                 letterSpacing: 1.3,
//               ),
//             ),
//           );
//   }

//   Widget _buildOption() {
//     return PopupMenuButton(
//       itemBuilder: (context) {
//         final cubit = context.read<QuestionListCubit>();
//         void back() => context.back();
//         return [
//           PopupMenuItem(
//             child: ListTile(
//               title: const Text('Modifier'),
//               leading: const Icon(Icons.edit),
//               onTap: () async {
//                 final newQuestion = await context
//                     .to<QuestionModel>(QuestionRoute.edit(question_));

//                 if (newQuestion != null) {
//                   cubit.onUpdateQuestion(newQuestion);
//                 }
//                 back();
//               },
//             ),
//           ),
//           PopupMenuItem(
//             child: ListTile(
//               title: const Text('Supprimer'),
//               leading: const Icon(Icons.delete),
//               onTap: () {
//                 context.read<QuestionListCubit>().delete(question_);
//                 context.back();
//               },
//             ),
//           ),
//         ];
//       },
//     );
//   }
// }

class _QuestionItem extends StatelessWidget {
  final QuestionModel question_;

  const _QuestionItem(this.question_);

  @override
  Widget build(BuildContext context) {
    // Check if questions list is null or empty before accessing
    if (question_.questions == null || question_.questions!.isEmpty) {
      return const Text('No questions available');
    }

    // Safely access the first question since we know the list is not empty
    final question = question_.questions!.first;

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
                  value: question_.exams != null &&
                          question_.exams!.isNotEmpty
                      ? question_.exams!.first.title
                      : 'Il n\'y a pas d\'examen',
                  color: question_.exams != null &&
                          question_.exams!.isNotEmpty
                      ? Colors.teal
                      : Colors.transparent,
                ),
              ),
              _buildOption(),
            ],
          ),
          const Divider(),
          Text(
            '  ${question_.caseText ?? question.text}  ',
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
                value: question_.type,
                color: question_.type?.toLowerCase() == 'cas clinique'
                    ? Colors.blue
                    : Colors.teal,
              ),
              const Spacer(),
              _buildHint(
                value: question_.withExplanation == true
                    ? 'Has Explanation'
                    : null,
                color: Colors.purple,
              ),
            ],
          ),
          _buildValue(
            title: 'Cours: ',
            value: question_.course?.name,
          ),
          _buildValue(
            title: 'Source: ',
            value: question_.sources != null && question_.sources!.isNotEmpty
                ? question_.sources
                    .map((e) => '${e.source?.name} | ${e.year}')
                    .join(', ')
                : 'No sources available',
          ),
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
                    .to<QuestionModel>(QuestionRoute.edit(question_));

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
                context.read<QuestionListCubit>().delete(question_);
                context.back();
              },
            ),
          ),
        ];
      },
    );
  }
}
