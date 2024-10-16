import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user.api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET(UserApiConstants.admins)
  Future<PaginatedDataResponse> getAdmins();

  @POST(UserApiConstants.admins)
  Future<DataResponse> createAdmin(
    @Body() Map<String, dynamic> body,
  );

  @DELETE(UserApiConstants.admin)
  Future<MessageResponse> deleteAdmin(
    @Path('id') String id,
  );
}
