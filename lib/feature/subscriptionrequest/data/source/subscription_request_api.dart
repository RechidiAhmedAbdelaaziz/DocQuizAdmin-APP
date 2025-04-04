import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'subscription_request_api.g.dart';

@RestApi()
abstract class SubscriptionRequestApi {
  factory SubscriptionRequestApi(
    Dio dio,
  ) = _SubscriptionRequestApi;

  @GET(UserApiConstants.subscriptionRequest)
  Future<PaginatedDataResponse> getAllRequests(
    @Queries() Map<String, dynamic> queries,
  );

  @PATCH(UserApiConstants.subscriptionRequestWithId)
  Future<MessageResponse> approveRequest(
    @Path('id') String id,
  );

  @DELETE(UserApiConstants.subscriptionRequestWithId)
  Future<MessageResponse> deleteRequest(
    @Path('id') String id,
  );
}
