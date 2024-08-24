part of 'exam.screen.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();
    return FloatingActionButton(
      onPressed: () async {
        _createExam(
          examDetails: await context.to(CreateExamRoute()),
          createExam: cubit.createExam,
        );
      },
      child: const Icon(Icons.add),
    );
  }

  void _createExam({
    required CreateExamParam? examDetails,
    required void Function({
      required CreateExamParam details,
    }) createExam,
  }) {
    if (examDetails != null) createExam(details: examDetails);
  }
}
