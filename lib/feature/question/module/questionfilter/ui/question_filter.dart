import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/question/module/questionfilter/logic/question_filter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionFilter extends StatelessWidget {
  const QuestionFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionFilterCubit>();
    final filter = context
        .select((QuestionFilterCubit cubit) => cubit.state.filter);
    return Column(
      children: [
        Row(
          children: [
            width(35),
            Text(
              'Filter',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            //apply button
            TextButton(
              onPressed: () => Navigator.of(context).pop(filter),
              child: const Text('Apply'),
            ),
          ],
        ),
        const Divider(),
        _buildTitle('Types'),
        _buildFilter(
          filters: ['QCM', 'QCU', 'Cas Clinique'],
          selectedFilters: filter.types,
          onSelect: (type) => cubit.selectType(type),
        ),
        height(20),
        _buildTitle('Difficulties'),
        _buildFilter(
          filters: ['Easy', 'Medium', 'Hard'],
          selectedFilters: filter.difficulties,
          onSelect: (difficulty) =>
              cubit.selectDifficulty(difficulty),
        ),
        height(20),
        _buildTitle('Additional Filters'),
        _buildFilter(
          filters: ['With Explanation', 'Without Explanation'],
          selectedFilters: [
            if (filter.withExplanation) 'With Explanation',
            if (filter.withoutExplanation) 'Without Explanation',
          ],
          onSelect: (filter) => cubit.setWithExplanation(
            filter == 'With Explanation',
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          " $title :",
          style:
              TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFilter({
    required List<String> filters,
    required List<String> selectedFilters,
    required Function(String) onSelect,
  }) {
    return Wrap(
      spacing: 20.w,
      children: filters
          .map(
            (filter) => FilterChip(
              label: Text(filter),
              selected: selectedFilters.contains(filter),
              onSelected: (selected) => onSelect(filter),
            ),
          )
          .toList(),
    );
  }
}
