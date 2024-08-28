part of 'questions_list.screen.dart';

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        context.showPopUp(
          content: BlocProvider.value(
            value: context.read<QuestionFilterCubit>(),
            child: _FilterBox(
              onApply: () {
                context
                    .read<QuestionListCubit>()
                    .fetchQuestions(more: false);
              },
            ),
          ),
        );
      },
    );
  }
}

class _FilterBox extends StatelessWidget {
  const _FilterBox({required VoidCallback onApply})
      : _onApply = onApply;

  final VoidCallback _onApply;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<QuestionFilterCubit>();
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: 400.w,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buidHeader(
              onApply: () {
                _onApply();
                context.back();
              },
            ),
            const Divider(),
            height(20),
            _buildTypesFilter(cubit),
            height(8),
            const Divider(),
            height(20),
            _buildDifficultiesFilter(cubit),
            height(8),
            const Divider(),
            height(20),
            _buildWithExplanationFilter(cubit),
          ],
        ),
      ),
    );
  }

  Column _buildWithExplanationFilter(QuestionFilterCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by explanation : ',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        height(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'With explanation',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Checkbox.adaptive(
              value: cubit.withExplanation,
              onChanged: (value) {
                cubit.filterWithExplanation(value ?? false);
              },
            ),
          ],
        ),
      ],
    );
  }

  Column _buildDifficultiesFilter(QuestionFilterCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by difficulty : ',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        height(10),
        Wrap(
          spacing: 12.w,
          children: [
            ...["easy", "medium", "hard"].map((difficulty) {
              return _FilterItem(
                title: difficulty.toUpperCase(),
                selected: cubit.difficulties.contains(difficulty),
                onSelected: () {
                  cubit.filterDifficulty(difficulty);
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Column _buildTypesFilter(QuestionFilterCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by type : ',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        height(10),
        Wrap(
          spacing: 12.w,
          children: [
            ...["QCM", "QCU"].map((type) {
              return _FilterItem(
                title: type,
                selected: cubit.types.contains(type),
                onSelected: () {
                  cubit.filterType(type);
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Row _buidHeader({
    required VoidCallback onApply,
  }) {
    return Row(
      children: [
        const Spacer(),
        Text(
          'Filters',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onApply,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterItem extends StatelessWidget {
  const _FilterItem({
    required String title,
    required bool selected,
    required VoidCallback onSelected,
  })  : _title = title,
        _selected = selected,
        _onSelected = onSelected;

  final String _title;
  final bool _selected;
  final VoidCallback _onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSelected,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: _selected ? Colors.blue : Colors.grey[100],
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: !_selected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Text(
          _title,
          style: TextStyle(
            color: _selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
