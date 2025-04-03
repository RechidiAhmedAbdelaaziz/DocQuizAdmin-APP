import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/shared/dto/pagination_dto.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/subscriptionoffers/data/dto/subscription_offer_dto.dart';
import 'package:admin_app/feature/subscriptionoffers/data/models/subscription_offer_model.dart';
import 'package:admin_app/feature/subscriptionoffers/data/source/subcription_offer_api.dart';

class SubscriptionOfferRepo {
  final _api = locator<SubscriptionOfferApi>();

  RepoListResult<SubscriptionOfferModel> getSubscriptionOffers(
      PaginationDto dto) async {
    apiCall() async {
      final response = await _api.getSubscriptionOffers(dto.toJson());
      return response.data!
          .map(
            (e) => SubscriptionOfferModel.fromJson(e),
          )
          .toList();
    }

    return TryCallApi.call(apiCall);
  }

  RepoResult<SubscriptionOfferModel> createSubscriptionOffer(
      CreateSubscriptionOfferDto dto) async {
    apiCall() async {
      final response =
          await _api.createSubscriptionOffer(await dto.toMap());
      return SubscriptionOfferModel.fromJson(response.data!);
    }

    return TryCallApi.call(apiCall);
  }

  RepoResult<SubscriptionOfferModel> updateSubscriptionOffer(
      UpdateSubscriptionOfferDto dto) async {
    apiCall() async {
      final response = await _api.updateSubscriptionOffer(
          dto.id, await dto.toMap());
      return SubscriptionOfferModel.fromJson(response.data!);
    }

    return TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteSubscriptionOffer(
      SubscriptionOfferModel model) async {
    apiCall() async => await _api.deleteSubscriptionOffer(model.id!);

    return TryCallApi.call(apiCall);
  }
}
