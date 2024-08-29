part of 'major.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold(
      {required String title,
      required Widget majorList,
      required Widget floatingActionButton,
      required Widget Function(Widget) builder})
      : _title = title,
        _majorList = majorList,
        _floatingActionButton = floatingActionButton,
        _builder = builder;

  final String _title;
  final Widget _majorList;
  final Widget _floatingActionButton;
  final Widget Function(Widget) _builder;

  @override
  Widget build(BuildContext context) {
    return _builder(
      Scaffold(
        appBar: AppBar(title: Text(_title), centerTitle: true),
        body: SingleChildScrollView(child: _majorList),
        floatingActionButton: _floatingActionButton,
      ),
    );
  }
}
