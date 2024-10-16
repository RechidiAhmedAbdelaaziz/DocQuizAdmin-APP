import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/shared/widget/inpute_field.widget.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/user/logic/user.cubit.dart';
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
          return Container(
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
                      ? Colors.teal
                      : Colors.orange,
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.showPopUp(
          content: _AddAdmin(
            onAdd: (email, {isAdmin}) {
              context
                  .read<UserCubit>()
                  .addUser(email, isAdmin: isAdmin);
              Navigator.of(context).pop();
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AddAdmin extends StatefulWidget {
  const _AddAdmin({required this.onAdd});

  final void Function(String email, {bool? isAdmin}) onAdd;

  @override
  State<_AddAdmin> createState() => _AddAdminState();
}

class _AddAdminState extends State<_AddAdmin> {
  bool isAdmin = false;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () =>
            widget.onAdd(emailController.text, isAdmin: isAdmin),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ajouter un admin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height(12),
              AppInputeField(
                controller: emailController,
                hint: 'Email',
              ),
              height(12),
              Row(
                children: [
                  Checkbox(
                    value: isAdmin,
                    onChanged: (value) {
                      setState(() => isAdmin = !isAdmin);
                    },
                  ),
                  const Text('isAdmin'),
                ],
              ),
              height(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildButton(
                    text: 'Annuler',
                    color: Colors.red,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  width(12),
                  _buildButton(
                    text: 'Ajouter',
                    color: Colors.green,
                    onTap: () => widget.onAdd(emailController.text,
                        isAdmin: isAdmin),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
