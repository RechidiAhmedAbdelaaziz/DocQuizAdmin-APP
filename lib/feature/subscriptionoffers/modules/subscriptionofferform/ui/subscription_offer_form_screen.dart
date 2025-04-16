import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/models/named.model.dart';
import 'package:admin_app/core/shared/widget/button.dart';
import 'package:admin_app/core/shared/widget/date_field.dart';
import 'package:admin_app/core/shared/widget/model_selector.dart';
import 'package:admin_app/core/shared/widget/multi_model_selector.dart';
import 'package:admin_app/core/shared/widget/text_field.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/domain/ui/domain_selector.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/level/ui/level_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/subscription_offer_form_cubit.dart';

class SubscriptionOfferFormScreen extends StatelessWidget {
  const SubscriptionOfferFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SubscriptionOfferFormCubit>().dto;

    return BlocListener<SubscriptionOfferFormCubit,
            SubscriptionOfferFormState>(
        listener: (context, state) {
          state.onLoadOffer(context.back);
        },
        child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              title: const Text('Subscription Offer Form'),
            ),
            body: Padding(
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
                        itemBuilder: (context, model) =>
                            _buildNamedModel(model),
                        selector: DomainSelector<DomainModel>(),
                        isRequired: true,
                      ),
                      heightSpace(25),
                      MultiModelSelector(
                        controller: dto.levelsController,
                        title: "Niveaux",
                        itemsBuilder: (context, models) {
                          return Wrap(
                            spacing: 8.w,
                            runSpacing: 4.h,
                            children: models
                                .map(
                                  (model) => _buildNamedModel(
                                    model,
                                    onDelete: () {
                                      dto.levelsController
                                          .removeValue(model);
                                    },
                                  ), // Add onDelete callback
                                )
                                .toList(),
                          );
                        },
                        selector: () => dto.domainController.value !=
                                null
                            ? LevelSelector<LevelModel>(
                                dto.domainController.value!)
                            : const Text(
                                'Veuillez d\'abord choisir un domaine'),
                        isRequired: true,
                      ),
                      heightSpace(25),
                      AppDateField(
                        controller: dto.endDateController,
                        label: "Date de fin",
                        isRequired: true,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now()
                            .add(const Duration(days: 365)),
                        validator: (value) => (value == null)
                            ? 'Sil vous plaît entrez une date valide'
                            : null,
                      ),
                      heightSpace(25),
                      AppButton.primary(
                        text: "Enregistrer",
                        suffixIcon: Icons.save,
                        isLoading: (ctx) => ctx.select(
                          (SubscriptionOfferFormCubit cubit) =>
                              cubit.state.isLoading,
                        ),
                        onPressed: () {
                          context
                              .read<SubscriptionOfferFormCubit>()
                              .saveOffer();
                        },
                      ),
                      heightSpace(12),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _buildNamedModel(
    NamedModelBase model, {
    void Function()? onDelete,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            model.name ?? '',
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          if (onDelete != null) ...[
            widthSpace(8),
            InkWell(
              onTap: onDelete,
              child: const Icon(
                Icons.close,
                color: AppColors.red,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
