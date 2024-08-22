part of 'course.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold(
      {required String title,
      required Widget courseList,
      required Widget floatingActionButton,
      required Widget Function(Widget) builder})
      : _title = title,
        _courseList = courseList,
        _floatingActionButton = floatingActionButton,
        _builder = builder;

  final String _title;
  final Widget _courseList;
  final Widget _floatingActionButton;
  final Widget Function(Widget) _builder;

  @override
  Widget build(BuildContext context) {
    return _builder(
      Scaffold(
        appBar: AppBar(title: Text(_title), centerTitle: true),
        body: SingleChildScrollView(child: _courseList),
        floatingActionButton: _floatingActionButton,
      ),
    );
  }
}
