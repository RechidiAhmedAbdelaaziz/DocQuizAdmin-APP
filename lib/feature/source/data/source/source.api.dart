import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'source.api.g.dart';

@RestApi()
abstract class SourceApi {
  factory SourceApi(Dio dio, {String baseUrl}) = _SourceApi;

  @GET(UserApiConstants.sources)
  Future<PaginatedDataResponse> getSources();

  @POST(AdminApiConstants.source)
  Future<DataResponse> createSource(
      @Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.sourceWithId)
  Future<DataResponse> updateSource(
      @Path('id') String id, @Body() Map<String, dynamic> body);

  @DELETE(AdminApiConstants.sourceWithId)
  Future<MessageResponse> deleteSource(@Path('id') String id);
}
