import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/question/data/dto/list_question.dto.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_filter.cubit.dart';
import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/question.model.dart';

part 'scaffold.dart';
part 'filter_button.dart';
part 'floating_button.dart';
part 'question_list.dart';
part 'search_bar.dart';

class QuestionsListScreen extends StatelessWidget {
  const QuestionsListScreen({
    super.key,
    ListQuestionsBody? initialFilter,
  }) : _initialFilter = initialFilter;

  final ListQuestionsBody? _initialFilter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              QuestionFilterCubit(filter: _initialFilter),
        ),
        BlocProvider(
          create: (context) => QuestionListCubit(
            filterCubit: context.read<QuestionFilterCubit>(),
          )..fetchQuestions(),
        ),
      ],
      child: _Scaffold(
        searchBar: const _SearchBar(),
        filterButton: const _FilterButton(),
        questionList: const _QuestionList(),
        floatingActionButton: const _FloatingButton(),
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => context.showErrorSnackBar(message),
            updatedQuestions: () => context
                .showSuccessSnackBar('Question updated successfully'),
            addedQuestions: () => context
                .showSuccessSnackBar('Question added successfully'),
          );
        },
      ),
    );
  }
}
