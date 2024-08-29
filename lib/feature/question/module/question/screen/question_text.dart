part of 'question.screen.dart';

class _QuestionText extends StatelessWidget {
  const _QuestionText();

  @override
  Widget build(BuildContext context) {
    final questionText = context.select(
      (QuestionCubit cubit) => cubit.details.questionText,
    );
    return _InputeField(
      title: 'Question',
      hintText: 'Enter question',
      initialValue: questionText,
      onChanged: context.read<QuestionCubit>().setQuestionText,
      validator: (value) => value.isValidString,
    );
  }
}
