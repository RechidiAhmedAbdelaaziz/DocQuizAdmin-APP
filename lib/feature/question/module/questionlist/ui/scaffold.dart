part of 'questions_list.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget filterButton,
    required Widget questionList,
    required Widget floatingActionButton,
    required void Function(BuildContext, QuestionListState) listener,
  })  : _filterButton = filterButton,
        _questionList = questionList,
        _floatingActionButton = floatingActionButton,
        _listener = listener;

  final Widget _filterButton;
  final Widget _questionList;
  final Widget _floatingActionButton;
  final void Function(BuildContext, QuestionListState) _listener;

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionListCubit, QuestionListState>(
      listener: _listener,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
          actions: [_filterButton],
        ),
        body: _questionList,
        floatingActionButton: _floatingActionButton,
      ),
    );
  }
}
