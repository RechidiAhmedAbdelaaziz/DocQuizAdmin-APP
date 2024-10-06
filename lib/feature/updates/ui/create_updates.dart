import 'package:admin_app/core/shared/widget/inpute_field.widget.dart';
import 'package:admin_app/feature/updates/data/model/updates.model.dart';
import 'package:admin_app/feature/updates/logic/updtes.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUpdates extends StatelessWidget {
  CreateUpdates({super.key, this.update})
      : titleController = TextEditingController(text: update?.title),
        descriptionController =
            TextEditingController(text: update?.description);

  final UpdatesModel? update;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdatesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Update'),
        centerTitle: true,
        actions: [
          if (update != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                cubit.deleteUpdate(update!);
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppInputeField(
              controller: titleController,
              hint: 'Titre',
            ),
            const SizedBox(height: 16),
            AppInputeField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              hint: 'Description',
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                if (update != null) {
                  cubit.updateUpdate(
                    update!.copyWith(
                      title: titleController.text,
                      description: descriptionController.text,
                    ),
                  );
                } else {
                  cubit.addUpdate(
                    title: titleController.text,
                    description: descriptionController.text,
                  );
                }
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
