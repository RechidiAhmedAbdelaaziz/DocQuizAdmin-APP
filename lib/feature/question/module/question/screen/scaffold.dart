part of 'question.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget questionText,
    required Widget answers,
    required Widget explanation,
    required Widget difficulty,
    required Widget source,
    required Widget field,
    required Widget saveButton,
  })  : _questionText = questionText,
        _answers = answers,
        _explanation = explanation,
        _difficulty = difficulty,
        _source = source,
        _field = field,
        _saveButton = saveButton;

  final Widget _questionText;
  final Widget _answers;
  final Widget _explanation;
  final Widget _difficulty;
  final Widget _source;
  final Widget _field;
  final Widget _saveButton;

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionCubit, QuestionState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) => context.showErrorSnackBar(error),
          creatingQuestion: () => context.back(),
          updatingQuestion: () => context.back(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Question'),
        ),
        body: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(22),
              _questionText,
              Divider(height: 22.h),
              _answers,
              Divider(height: 22.h),
              _explanation,
              Divider(height: 22.h),
              _difficulty,
              Divider(height: 22.h),
              _source,
              Divider(height: 22.h),
              _field,
              Divider(height: 22.h),
              _saveButton,
            ],
          ),
        ),
      ),
    );
  }
}
