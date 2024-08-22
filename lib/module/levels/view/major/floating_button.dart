part of 'major.screen.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final form = _Form();
        context.showAlertDialog(
          title: 'Add Major',
          content: form,
          confirmText: 'Add',
          onConfirm: (back) async {
            if (form.formKey.currentState!.validate()) {
              context.read<MajorCubit>().addMajor(
                    name: form.name,
                    icon: form.icon,
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

  final _nameController = TextEditingController();
  final _key = GlobalKey<FormState>();
  File? _icon;

  String get name => _nameController.text;
  File? get icon => _icon;
  GlobalKey<FormState> get formKey => _key;

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: widget._nameController,
            validator: (value) => value.isString,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Select Icon'),
          ),
          if (widget._icon != null)
            Image.file(widget._icon!, height: 100.h, width: 100.w),
        ],
      ),
    );
  }

  void _pickImage() async {
    final file = await locator<ImagePickerHelper>().pickImage();
    if (file != null) {
      setState(() {
        widget._icon = File(file.path);
      });
    }
  }
}
