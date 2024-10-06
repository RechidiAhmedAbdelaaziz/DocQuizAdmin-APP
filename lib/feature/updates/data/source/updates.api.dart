import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'updates.api.g.dart';

@RestApi()
abstract class UpdatesApi {
  factory UpdatesApi(Dio dio, {String baseUrl}) = _UpdatesApi;

  @GET(UserApiConstants.updates)
  Future<PaginatedDataResponse> getUpdates();

  @POST(AdminApiConstants.updates)
  Future<DataResponse> createUpdate(
      @Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.updatesWithId)
  Future<DataResponse> updateUpdate(
      @Path('id') String id, @Body() Map<String, dynamic> body);

  @DELETE(AdminApiConstants.updatesWithId)
  Future<MessageResponse> deleteUpdate(@Path('id') String id);
}
