import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/feature/subscriptionoffers/helper/subscription_offer_route.dart';
import 'package:flutter/material.dart';

class MultiSubscriptionOfferScreen extends StatelessWidget {
  const MultiSubscriptionOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer'),
        actions: [
          IconButton(
              onPressed: () =>
                  context.to(SubscriptionOfferRoute.create()),
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
