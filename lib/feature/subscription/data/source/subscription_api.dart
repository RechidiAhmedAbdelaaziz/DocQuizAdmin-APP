import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:admin_app/feature/subscription/data/models/subscription_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'subscription_api.g.dart';

@RestApi()
abstract class SubscriptionApi {
  factory SubscriptionApi(Dio dio, {String baseUrl}) =
      _SubscriptionApi;

  @GET(UserApiConstants.subscription)
  Future<PaginatedDataResponse> getSubscription(
    @Queries() Map<String, dynamic> queries,
  );

  @POST(UserApiConstants.subscription)
  Future<DataResponse> createSubscription(
    @Body() Map<String, dynamic> body,
  );

  @DELETE(UserApiConstants.subscriptionWithId)
  Future<MessageResponse> deleteSubscription(
    @Path('id') String id,
  );
}
