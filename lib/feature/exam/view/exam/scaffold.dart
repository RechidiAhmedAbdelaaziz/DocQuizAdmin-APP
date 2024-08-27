part of 'exam.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required String title,
    required Widget examList,
    required Widget floatingActionButton,
    required void Function(BuildContext, ExamState) listener,
  })  : _title = title,
        _examList = examList,
        _floatingActionButton = floatingActionButton,
        _listener = listener;

  final String _title;
  final Widget _examList;
  final Widget _floatingActionButton;
  final void Function(BuildContext, ExamState) _listener;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listener: _listener,
      child: Scaffold(
        appBar: AppBar(title: Text(_title), centerTitle: true),
        body: SingleChildScrollView(child: _examList),
        floatingActionButton: _floatingActionButton,
      ),
    );
  }
}
