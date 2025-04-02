import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/subscription_offer_form_cubit.dart';

class SubscriptionOfferFormScreen extends StatelessWidget {
  const SubscriptionOfferFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SubscriptionOfferFormCubit>().dto;
    return Scaffold(
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
                    TextField(
                      controller: dto.titleController,
                      decoration:
                          const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: dto.descriptionController,
                      decoration: const InputDecoration(
                          labelText: 'Description'),
                    ),
                    TextField(
                      controller: dto.priceController,
                      decoration:
                          const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                    height(25),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<SubscriptionOfferFormCubit>()
                            .saveOffer();
                      },
                      child: const Text('Save'),
                    ),
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
