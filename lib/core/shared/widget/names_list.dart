import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:admin_app/core/shared/models/named.model.dart';
import 'package:admin_app/core/shared/widget/check_box.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NamesList<T extends NamedModelBase> extends StatelessWidget {
  const NamesList({
    super.key,
    this.onTap,
    required this.title,
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onAdd,
  });

  final String title;
  final List<T> items;
  final void Function(T)? onTap;
  final void Function(T) onDelete;
  final void Function(T, String name, [bool? isOpen]) onEdit;
  final void Function(String name, [bool? isOpen]) onAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () => onTap?.call(item),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 8.h),
              margin: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.spMin,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () =>
                            _showEditDialog(context, item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => context.showDialogBox(
                          title: 'Supprimer',
                          body:
                              'Voulez-vous vraiment supprimer ${item.name}?',
                          confirmText: 'Supprimer',
                          onConfirm: (back) {
                            onDelete(item);
                            back();
                          },
                          cancelText: 'Annuler',
                          onCancel: (back) => back(),
                        ),
                      ),
                    ],
                  ),
                  if (item is MajorModel)
                    Container(
                      padding: EdgeInsets.all(8).r,
                      margin: EdgeInsets.only(top: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: item.isOpen!
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      child: Text(
                        item.isOpen! ? 'Gratuit' : 'Payant',
                        style: TextStyle(
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w500,
                          color: item.isOpen!
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditDialog(BuildContext context, T item) {
    final controller = TextEditingController(text: item.name);
    final boolController = item is MajorModel
        ? EditingController<bool>((item as MajorModel).isOpen)
        : null;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: controller),
              height(8),
              if (boolController != null)
                AppCheckBox(
                    controller: boolController, title: 'Gratuit'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onEdit(item, controller.text, boolController?.value);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    final controller = TextEditingController();
    final boolController = items.whereType<MajorModel>().isNotEmpty
        ? EditingController<bool>()
        : null;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: controller),
              height(8),
              if (boolController != null)
                AppCheckBox(
                    controller: boolController, title: 'Gratuit'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onAdd(controller.text, boolController?.value);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
