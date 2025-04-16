import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/shared/widget/inpute_field.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/auth/data/models/user.model.dart';
import 'package:admin_app/feature/user/logic/user.cubit.dart';
import 'package:admin_app/feature/user/userform/logic/user_form_cubit.dart';
import 'package:admin_app/feature/user/userform/ui/user_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.watch<UserCubit>().state.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admins '),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<UserCubit>().getUsers(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return InkWell(
            onTap: () => context.dialogWith<UserModel>(
              child: BlocProvider(
                create: (context) => UserFormCubit(user),
                child: const UserForm(),
              ),
              onResult: (user) =>
                  context.read<UserCubit>().getUsers(),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: user.role == 'Admin'
                        ? user.role == 'SuperAdmin'
                            ? Colors.red
                            : Colors.blue
                        : Colors.green,
                    child: Text(
                      user.role!.substring(0, 1),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  width(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email!,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () => context.showDialogBox(
                      title: 'Supprimer',
                      content: RichText(
                        text: TextSpan(
                          text: 'Voulez-vous vraiment supprimer ',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: user.name,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const TextSpan(text: ' ?'),
                          ],
                        ),
                      ),
                      confirmText: 'Supprimer',
                      onConfirm: (back) {
                        context.read<UserCubit>().deleteUser(user);
                        back();
                      },
                      cancelText: 'Annuler',
                      onCancel: (back) => back(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.dialogWith<UserModel>(
          child: BlocProvider(
            create: (context) => UserFormCubit(),
            child: const UserForm(),
          ),
          onResult: (user) => context.read<UserCubit>().getUsers(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
