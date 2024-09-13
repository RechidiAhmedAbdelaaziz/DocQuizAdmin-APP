import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'major.api.g.dart';

@RestApi()
abstract class MajorApi {
  factory MajorApi(Dio dio, {String baseUrl}) = _MajorApi;

  @GET(UserApiConstants.majors)
  Future<PaginatedDataResponse> getMajors(
    {
      @Query('levelId') String? levelId,
    }
  );

  @POST(AdminApiConstants.majorWithLevelId)
  Future<DataResponse> createMajor(@Path('levelId') String levelId,
      @Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.majorWithId)
  Future<DataResponse> updateMajor(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(AdminApiConstants.majorWithId)
  Future<MessageResponse> deleteMajor(
    @Path('id') String id,
  );
}
