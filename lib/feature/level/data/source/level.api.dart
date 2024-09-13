import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'level.api.g.dart';

@RestApi()
abstract class LevelApi {
  factory LevelApi(Dio dio, {String baseUrl}) = _LevelApi;

  @GET(UserApiConstants.levels)
  Future<PaginatedDataResponse> getLevels(
    {
      @Query('domainId') String? domainId,
    }
  );

  @POST(AdminApiConstants.levelWithDomainId)
  Future<DataResponse> createLevel(@Path('domainId') String domainId,
      @Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.levelWithId)
  Future<DataResponse> updateLevel(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(AdminApiConstants.levelWithId)
  Future<MessageResponse> deleteLevel(
    @Path('id') String id,
  );
}
