part of 'create_exam.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget form,
    required Widget saveButton,
    required Widget resetButton,
  })  : _form = form,
        _saveButton = saveButton,
        _resetButton = resetButton;

  final String _title = 'Create Exam';
  final Widget _form;
  final Widget _saveButton;
  final Widget _resetButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        actions: [
          _resetButton,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height(24),
            _form,
            height(30),
            _saveButton,
          ],
        ),
      ),
    );
  }
}
