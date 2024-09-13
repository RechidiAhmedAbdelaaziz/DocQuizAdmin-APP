import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'domain.api.g.dart';

@RestApi()
abstract class DomainApi {
  factory DomainApi(Dio dio, {String baseUrl}) = _DomainApi;

  @GET(UserApiConstants.domains)
  Future<PaginatedDataResponse> getDomains();

  @POST(AdminApiConstants.domain)
  Future<DataResponse> createDomain(
      @Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.domainWithId)
  Future<DataResponse> updateDomain(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(AdminApiConstants.domainWithId)
  Future<MessageResponse> deleteDomain(
    @Path('id') String id,
  );
}
