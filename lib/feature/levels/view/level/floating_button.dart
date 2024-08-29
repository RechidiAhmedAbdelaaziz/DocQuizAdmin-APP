part of 'level.screen.dart';

class _FloatingButton extends StatelessWidget {
  _FloatingButton();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final onAddLevel = context.read<LevelCubit>().addLevel;

    return FloatingActionButton(
      onPressed: () {
        context.showDialogBox(
          title: 'Add Level',
          content: Form(key: _formKey, child: _buidlForm()),
          confirmText: 'Add',
          onConfirm: (back) {
            if (_formKey.currentState?.validate() == true) {
              onAddLevel(_nameController.text);
              back();
            }
          },
          cancelText: 'Cancel',
          onCancel: (back) => back(),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _buidlForm() {
    return TextFormField(
      controller: _nameController,
      validator: (value) => value.isValidString,
      decoration: const InputDecoration(
        hintText: 'Enter level name',
      ),
    );
  }
}
