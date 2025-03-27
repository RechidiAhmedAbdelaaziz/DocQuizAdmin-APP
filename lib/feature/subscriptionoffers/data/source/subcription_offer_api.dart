import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'subcription_offer_api.g.dart';

@RestApi()
abstract class SubscriptionOfferApi {
  factory SubscriptionOfferApi(Dio dio, {String baseUrl}) =
      _SubcriptionOfferApi;

  @GET(AdminApiConstants.subscriptionOffer)
  Future<PaginatedDataResponse> getSubscriptionOffers(
    @Queries() Map<String, dynamic>? queries,
  );

  @POST(AdminApiConstants.subscriptionOffer)
  Future<DataResponse> createSubscriptionOffer(
    @Body() Map<String, dynamic> body,
  );

  @PATCH(AdminApiConstants.subscriptionOfferWithId)
  Future<DataResponse> updateSubscriptionOffer(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(AdminApiConstants.subscriptionOfferWithId)
  Future<MessageResponse> deleteSubscriptionOffer(
    @Path('id') String id,
  );
}
