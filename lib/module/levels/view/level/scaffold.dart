part of 'level.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required String title,
    required Widget levelsList,
    required Widget floatingActionButton,
    required Widget Function(Widget) listener,
  })  : _title = title,
        _levelsList = levelsList,
        _floatingActionButton = floatingActionButton,
        _listener = listener;

  final String _title;
  final Widget _levelsList;
  final Widget _floatingActionButton;
  final Widget Function(Widget) _listener;

  @override
  Widget build(BuildContext context) {
    return _listener(Scaffold(
      appBar: AppBar(title: Text(_title), centerTitle: true),
      body: SingleChildScrollView(child: _levelsList),
      floatingActionButton: _floatingActionButton,
    ));
  }
}
