import 'package:admin_app/core/extension/alertdialog.extenstion.dart';
import 'package:admin_app/core/shared/widget/pagination.widget.dart';
import 'package:admin_app/core/themes/colors.dart';
import 'package:admin_app/core/themes/dimensions.dart';
import 'package:admin_app/core/themes/font_styles.dart';
import 'package:admin_app/feature/subscriptionrequest/data/models/subscription_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../logic/subscription_request_cubit.dart';

class SubscriptionRequestScreen extends StatelessWidget {
  const SubscriptionRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requests =
        context.watch<SubscriptionRequestCubit>().requests;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les demandes d\'abonnement'),
      ),
      body: PaginationBuilder(
        onFetch: () async =>
            context.read<SubscriptionRequestCubit>().loadRequests(),
        builder: (loadingWidget) {
          return Column(
            children: [
              ...requests.map(
                (request) => _buildRequestItem(
                  request,
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

  Widget _buildRequestItem(
    SubscriptionRequestModel request,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(8).r,
      margin: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColors.white,
        border:
            Border(bottom: BorderSide(color: AppColors.primaryDark)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.showDialogBox(
                    title: 'Confirmer',
                    content: Text(
                        'Voulez-vous vraiment refuser cette demande ?'),
                    confirmText: 'Refuser',
                    cancelText: 'Annuler',
                    onConfirm: (back) {
                      context
                          .read<SubscriptionRequestCubit>()
                          .rejectRequest(request);
                      back();
                    }),
                icon: const Icon(Icons.close, color: Colors.red),
              ),
              IconButton(
                  onPressed: () => context.showDialogBox(
                      title: 'Confirmer',
                      content: Text(
                          'Voulez-vous vraiment accepter cette demande ?'),
                      confirmText: 'Accepter',
                      cancelText: 'Annuler',
                      onConfirm: (back) {
                        context
                            .read<SubscriptionRequestCubit>()
                            .approveRequest(request);
                        back();
                      }),
                  icon: const Icon(Icons.check, color: Colors.green)),
            ],
          ),
          heightSpace(6),
          Text(
            request.user?.name ?? '',
            style: AppTextStyles.h4.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          heightSpace(4),
          Text(
            request.user?.email ?? '',
            style: AppTextStyles.medium.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                  child: Text(request.offer?.title ?? '',
                      style: AppTextStyles.medium.copyWith(
                        color: AppColors.primaryDark,
                      ))),
              widthSpace(8),
              Text(
                '${request.offer?.price.toString() ?? ''} DA',
                style: AppTextStyles.large.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          heightSpace(4),
          WidgetZoom(
            heroAnimationTag: 'zoom',
            zoomWidget: Container(
              height: 220.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                image: DecorationImage(
                  image: NetworkImage(request.proof ?? ''),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
