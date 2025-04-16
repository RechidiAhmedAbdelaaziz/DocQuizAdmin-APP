import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/subscriptionoffers/data/dto/subscription_offer_dto.dart';
import 'package:admin_app/feature/subscriptionoffers/data/models/subscription_offer_model.dart';
import 'package:admin_app/feature/subscriptionoffers/data/repository/subscription_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscription_offer_form_state.dart';

abstract class SubscriptionOfferFormCubit<
        T extends SubscriptionOfferDto>
    extends Cubit<SubscriptionOfferFormState> {
  final T _dto;
  final _repo = locator<SubscriptionOfferRepo>();

  T get dto => _dto;

  SubscriptionOfferFormCubit(this._dto)
      : super(SubscriptionOfferFormState.initial());

  void saveOffer();
}

class CreateSubscriptionOfferCubit
    extends SubscriptionOfferFormCubit<CreateSubscriptionOfferDto> {
  CreateSubscriptionOfferCubit()
      : super(CreateSubscriptionOfferDto());

  @override
  void saveOffer() async {
    if (state.isLoading || !_dto.validate()) return;
    emit(state._loadign());
    final result = await _repo.createSubscriptionOffer(_dto);
    result.when(
      success: (offer) => emit(state._loaded(offer)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}

class UpdateSubscriptionOfferCubit
    extends SubscriptionOfferFormCubit<UpdateSubscriptionOfferDto> {
  UpdateSubscriptionOfferCubit(
    SubscriptionOfferModel offer,
  ) : super(UpdateSubscriptionOfferDto(offer));

  @override
  void saveOffer() async {
    if (state.isLoading || !_dto.validate()) return;



    emit(state._loadign());

    final result = await _repo.updateSubscriptionOffer(_dto);
    result.when(
      success: (offer) => emit(state._loaded(offer)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
