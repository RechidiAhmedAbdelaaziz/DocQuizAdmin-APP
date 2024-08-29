part of 'questions_list.screen.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.to(CreateQuestionRoute(
          questionListCubit: context.read<QuestionListCubit>())),
      child: const Icon(Icons.add),
    );
  }
}
