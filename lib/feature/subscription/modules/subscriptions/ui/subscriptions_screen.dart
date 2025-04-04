import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/extension/date_formatter.extension.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/feature/subscription/data/models/subscription_model.dart';
import 'package:admin_app/feature/subscription/modules/subscriptionform/logic/subscription_form_cubit.dart';
import 'package:admin_app/feature/subscription/modules/subscriptionform/ui/subscription_form.dart';
import 'package:admin_app/feature/subscription/modules/subscriptions/logic/subscriptions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptions =
        context.watch<SubscriptionsCubit>().subscriptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
        actions: [
          IconButton(
              onPressed: () => context.dialogWith<SubscriptionModel>(
                    child: BlocProvider(
                      create: (context) => SubscriptionFormCubit(),
                      child: SubscriptionForm(),
                    ),
                    onResult: context
                        .read<SubscriptionsCubit>()
                        .addSubscription,
                  ),
              icon: Icon(Icons.add))
        ],
      ),
      body: PaginationBuilder(
        onFetch: () async =>
            context.read<SubscriptionsCubit>().getSubscriptions(),
        builder: (loadingWidget) {
          return Column(
            children: [
              ...subscriptions.map(
                (subscription) => _buildSubscriptionItem(
                  subscription,
                  context,
                ),
              ),
              loadingWidget,
            ],
          );
        },
      ),
    );
  }

  Widget _buildSubscriptionItem(
    SubscriptionModel subscription,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 16.w,
      ),
      padding: EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColors.white,
        border:
            Border(bottom: BorderSide(color: AppColors.primaryDark)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                      subscription.user?.name ?? 'Unknown User')),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.showDialogBox(
                    title: 'Delete Subscription',
                    content: Text(
                        'Are you sure you want to delete this subscription?'),
                    confirmText: "Supprimer",
                    cancelText: "Annuler",
                    onConfirm: (back) {
                      context
                          .read<SubscriptionsCubit>()
                          .deleteSubscription(subscription);
                      back();
                    },
                  );
                },
              ),
            ],
          ),
          const Divider(),
          Text(
            'Subscription Offer: ${subscription.offer?.title ?? 'Unknown'}',
          ),
          Text(
            'End Date: ${subscription.endDate?.toDayMonthYear()}',
          ),
        ],
      ),
    );
  }
}
