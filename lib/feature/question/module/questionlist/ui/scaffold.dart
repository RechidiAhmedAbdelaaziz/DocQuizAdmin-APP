part of 'questions_list.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget searchBar,
    required Widget filterButton,
    required Widget questionList,
    required Widget floatingActionButton,
    required void Function(BuildContext, QuestionListState) listener,
  })  : _filterButton = filterButton,
        _searchBar = searchBar,
        _questionList = questionList,
        _floatingActionButton = floatingActionButton,
        _listener = listener;

  final Widget _searchBar;
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
        body: PaginationBuilder(
          onFetch: () =>
              context.read<QuestionListCubit>().fetchQuestions(),
          builder: (loadingWidget) {
            return Column(
              children: [
                height(22),
                _searchBar,
                height(22),
                _questionList,
                loadingWidget,
              ],
            );
          },
        ),
        floatingActionButton: _floatingActionButton,
      ),
    );
  }
}
