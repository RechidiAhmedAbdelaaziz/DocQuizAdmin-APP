import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/core/network/try_call_api.dart';
import 'package:admin_app/core/shared/dto/pagination_dto.dart';
import 'package:admin_app/core/types/repo_functions.type.dart';
import 'package:admin_app/feature/subscription/data/dto/create_subscription_dto.dart';
import 'package:admin_app/feature/subscription/data/models/subscription_model.dart';
import 'package:admin_app/feature/subscription/data/source/subscription_api.dart';

class SubscriptionRepo {
  final _api = locator<SubscriptionApi>();

  RepoListResult<SubscriptionModel> getSubscriptions(
    PaginationDto dto,
  ) {
    apiCall() async {
      final response = await _api.getSubscription(dto.toJson());
      return response.data!
          .map(
            (e) => SubscriptionModel.fromJson(e),
          )
          .toList();
    }

    return TryCallApi.call(apiCall);
  }

  RepoResult<SubscriptionModel> createSubscription(
    CreateSubscriptionDto dto,
  ) {
    apiCall() async {
      final response =
          await _api.createSubscription(await dto.toMap());
      return SubscriptionModel.fromJson(response.data!);
    }

    return TryCallApi.call(apiCall);
  }

  RepoResult<void> deleteSubscription(
          SubscriptionModel subscription) =>
      TryCallApi.call(
        () async => await _api.deleteSubscription(subscription.id!),
      );
}
