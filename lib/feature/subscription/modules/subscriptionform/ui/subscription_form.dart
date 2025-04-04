import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/extension/snackbar.extension.dart';
import 'package:admin_app/core/shared/widget/button.dart';
import 'package:admin_app/core/shared/widget/model_selector.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/core/shared/widget/text_field.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/subscriptionoffers/modules/multisubscriptionoffer/logic/multi_subscription_offer_cubit.dart';
import 'package:admin_app/feature/subscriptionoffers/modules/multisubscriptionoffer/ui/multi_subscription_offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/subscription_form_cubit.dart';

class SubscriptionForm extends StatelessWidget {
  const SubscriptionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SubscriptionFormCubit>().dto;
    return BlocListener<SubscriptionFormCubit, SubscriptionFormState>(
      listener: (context, state) {
        state.onSave(context.back);
        state.onError(context.showErrorSnackBar);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        padding: EdgeInsets.all(12).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.blue),
          ),
        ),
        child: Form(
          key: dto.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                controller: dto.emailController,
                label: "Email de l'abonné",
                isRequired: true,
                keyboardType: TextInputType.emailAddress,
                validator: (email) => email?.isEmpty == true
                    ? "Email de l'abonné est requis"
                    : null,
              ),
              height(25),
              ModelSelector(
                controller: dto.subscriptionOfferController,
                title: "Offre d'abonnement",
                itemBuilder: (ctx, offer) => Text(
                  offer.title ?? "",
                  style: AppTextStyles.medium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                selector: BlocProvider(
                  create: (_) =>
                      MultiSubscriptionOfferCubit()..loadOffers(),
                  child: const MultiSubscriptionOfferScreen(
                      selectable: true),
                ),
                isRequired: true,
              ),
              height(25),
              AppButton.primary(
                text: "Ajouter",
                onPressed: context
                    .read<SubscriptionFormCubit>()
                    .createSubscription,
                isLoading: (ctx) => ctx.select(
                  (SubscriptionFormCubit cubit) =>
                      cubit.state.isLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
