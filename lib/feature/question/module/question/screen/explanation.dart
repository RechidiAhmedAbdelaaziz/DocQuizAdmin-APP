part of 'question.screen.dart';

class _Explanation extends StatelessWidget {
  const _Explanation();

  @override
  Widget build(BuildContext context) {
    final explanation = context.select(
      (QuestionCubit cubit) => cubit.details.explanation,
    );
    return _InputeField(
      title: 'Explanation',
      hintText: 'Enter explanation',
      initialValue: explanation,
      onChanged: context.read<QuestionCubit>().setExplanation,
    );
  }
}
