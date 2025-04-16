import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/shared/widget/button.dart';
import 'package:admin_app/core/shared/widget/dropdown_field.dart';
import 'package:admin_app/core/shared/widget/text_field.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/user/userform/logic/user_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatelessWidget {
  const UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<UserFormCubit>().state.userDto;
    return BlocListener<UserFormCubit, UserFormState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackBar);

        state.onSuccess((user) {
          context.back();
          context.showSuccessSnackBar(
            'Utilisateur ${user.name} mis à jour avec succès',
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Modifier un utilisateur', style: AppTextStyles.h4),
            heightSpace(32),
            AppTextField(
                controller: dto.emailController, label: 'Email'),
            heightSpace(16),
            AppDropDownField(
              controller: dto.roleController,
              label: 'Rôle',
              itemsBuilder: (_) =>
                  ['User', 'Moderator', 'Admin', 'SuperAdmin'],
              itemToString: (item) => item,
            ),
            heightSpace(32),
            AppButton.primary(
              onPressed: context.read<UserFormCubit>().save,
              isLoading: (context) => context.select(
                (UserFormCubit cubit) => cubit.state.isLoading,
              ),
              text: 'Enregistrer',
            ),
          ],
        ),
      ),
    );
  }
}
