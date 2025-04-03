import 'package:admin_app/core/shared/widget/model_selector.dart';
import 'package:admin_app/core/shared/widget/text_field.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/domain/ui/domain_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/subscription_offer_form_cubit.dart';

class SubscriptionOfferFormScreen extends StatelessWidget {
  const SubscriptionOfferFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SubscriptionOfferFormCubit>().dto;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Subscription Offer Form'),
      ),
      body: BlocBuilder<SubscriptionOfferFormCubit,
          SubscriptionOfferFormState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: dto.formKey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: dto.titleController,
                      label: "Titre",
                      isRequired: true,
                      validator: (value) =>
                          (value == null || value.isEmpty)
                              ? 'Sil vous plaît entrez un titre'
                              : null,
                    ),
                    heightSpace(25),
                    AppTextField(
                      controller: dto.descriptionController,
                      label: "Description",
                      isRequired: true,
                      keyboardType: TextInputType.multiline,
                      validator: (value) => (value == null ||
                              value.isEmpty)
                          ? 'Sil vous plaît entrez une description'
                          : null,
                    ),
                    heightSpace(25),
                    AppTextField(
                      controller: dto.priceController,
                      label: "Prix",
                      isRequired: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) => (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null)
                          ? 'Sil vous plaît entrez un prix valide'
                          : null,
                    ),
                    heightSpace(25),
                    ModelSelector(
                      controller: dto.domainController,
                      title: "Domaine",
                      itemBuilder: (context, model) {
                        return Text(
                          model.name ?? '',
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.primary,
                          ),
                        );
                      },
                      selector: DomainSelector<DomainModel>(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
