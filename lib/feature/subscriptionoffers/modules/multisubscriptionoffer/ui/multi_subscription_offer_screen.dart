import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/subscriptionoffers/data/models/subscription_offer_model.dart';
import 'package:admin_app/feature/subscriptionoffers/helper/subscription_offer_route.dart';
import 'package:admin_app/feature/subscriptionoffers/modules/multisubscriptionoffer/logic/multi_subscription_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiSubscriptionOfferScreen extends StatelessWidget {
  const MultiSubscriptionOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offers =
        context.watch<MultiSubscriptionOfferCubit>().offers;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Offer'),
          actions: [
            IconButton(
                onPressed: () =>
                    context.toWith<SubscriptionOfferModel>(
                      SubscriptionOfferRoute.create(),
                      onResult: context
                          .read<MultiSubscriptionOfferCubit>()
                          .createOffer,
                    ),
                icon: const Icon(Icons.add)),
          ],
        ),
        body: PaginationBuilder(
          onFetch: () async {
            context.read<MultiSubscriptionOfferCubit>().loadOffers();
          },
          builder: (loadingWidget) => Column(
            children: [
              ...offers
                  .map((offer) => _buildOfferCard(offer, context)),
              if (offers.isEmpty) loadingWidget,
            ],
          ),
        ));
  }

  Widget _buildOfferCard(
      SubscriptionOfferModel offer, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(
          color: AppColors.primaryDark,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  offer.title ?? '',
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              IconButton(
                onPressed: () =>
                    context.toWith<SubscriptionOfferModel>(
                  SubscriptionOfferRoute.edit(offer),
                  onResult: context
                      .read<MultiSubscriptionOfferCubit>()
                      .updateOffer,
                ),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => context.showDialogBox(
                    title: "Supprimer",
                    content: Text(
                        "Voulez-vous vraiment supprimer cette offre ?"),
                    confirmText: "Supprimer",
                    cancelText: "Annuler",
                    onConfirm: (back) {
                      context
                          .read<MultiSubscriptionOfferCubit>()
                          .deleteOffer(offer);
                      back();
                    }),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          Text(
            offer.description ?? '',
            style: AppTextStyles.normal,
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${offer.domain?.name ?? ''}:   ",
                style: AppTextStyles.large,
              ),
              Expanded(
                //show levels
                child: Wrap(
                  spacing: 8.w,
                  children: offer.levels
                      .map(
                        (level) => Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12).r,
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Text(
                            level.name ?? '',
                            style: AppTextStyles.normal.copyWith(
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          heightSpace(12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${offer.price} DA',
              style: AppTextStyles.xLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
