part of 'course.screen.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final form = _Form();
        context.showAlertDialog(
          title: 'Add Course',
          content: form,
          confirmText: 'Add',
          onConfirm: (back) {
            if (form.formKey.currentState!.validate()) {
              context.read<CourseCubit>().addCourse(
                    name: form.name,
                    isFree: form.isFree,
                  );
              back();
            }
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

// ignore: must_be_immutable
class _Form extends StatefulWidget {
  _Form();

  final _formKey = GlobalKey<FormState>();
  bool isFree = true;
  final _nameController = TextEditingController();

  String get name => _nameController.text;

  GlobalKey<FormState> get formKey => _formKey;

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: widget._nameController,
            validator: (value) => value.isValidString,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          CheckboxListTile(
            title: const Text('Is Free'),
            value: widget.isFree,
            onChanged: (value) {
              setState(() {
                widget.isFree = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
