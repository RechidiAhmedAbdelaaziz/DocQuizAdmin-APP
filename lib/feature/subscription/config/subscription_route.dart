

import 'package:admin_app/core/router/abstract_route.dart';
import 'package:admin_app/feature/subscription/modules/subscriptions/logic/subscriptions_cubit.dart';
import 'package:admin_app/feature/subscription/modules/subscriptions/ui/subscriptions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionRoute extends NavigatorRouteBase {
  static const subscriptionRoute = '/subscription';

  SubscriptionRoute()
      : super(
          subscriptionRoute,
          child: BlocProvider(
            create: (context) => SubscriptionsCubit()..getSubscriptions(),
            child: const SubscriptionsScreen(),
          ),
        );
}