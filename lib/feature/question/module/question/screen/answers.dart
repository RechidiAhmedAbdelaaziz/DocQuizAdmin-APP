part of 'question.screen.dart';

class _Answers extends StatelessWidget {
  const _Answers({super.key});

  @override
  Widget build(BuildContext context) {
    final answers = context.watch<QuestionCubit>().details.answers;

    return Column(
      children: [
        ...answers.map(
          (entry) {
            final index = entry.index;
            final answer = entry.answer;
            final isCorrect = entry.isCorrect;
            return _buildAnswer(
              answer: answer,
              isCorrect: isCorrect,
              controller: entry.controller,
              onChanged: (value) {
                context
                    .read<QuestionCubit>()
                    .updateAnswer(index, answer: value);
              },
              onChangedCorrect: (value) {
                context
                    .read<QuestionCubit>()
                    .updateAnswer(index, isCorrect: value);
              },
              onDelete: () {
                context.read<QuestionCubit>().deleteAnswer(index);
              },
            );
          },
        ),
        height(12),
        _buildAddAnswerButton(onAdd: () {
          context.read<QuestionCubit>().addAnswer();
        }),
      ],
    );
  }

  Widget _buildAddAnswerButton({
    required VoidCallback onAdd,
  }) {
    return InkWell(
      onTap: onAdd,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.grey,
              size: 30.sp,
            ),
            width(8),
            Text(
              'Add Answer',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswer({
    required String answer,
    required bool isCorrect,
    required VoidCallback onDelete,
    required Function(String) onChanged,
    required Function(bool) onChangedCorrect,
    required TextEditingController controller,
  }) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => onChangedCorrect(!isCorrect),
          child: Icon(
            isCorrect
                ? Icons.check_circle_outline
                : Icons.cancel_outlined,
            color: isCorrect ? Colors.green : Colors.red,
            size: 35.sp,
          ),
        ),
        width(12),
        Expanded(
          child: _InputeField(
            hintText: '',
            initialValue: answer,
            controller: controller,
            onChanged: onChanged,
            validator: (value) => value.isValidString,
          ),
        ),
        InkWell(
          onTap: onDelete,
          child: Icon(
            Icons.delete_outline,
            color: Colors.red,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
