import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'level.api.g.dart';

@RestApi()
abstract class LevelApiService {
  factory LevelApiService(Dio dio, {String baseUrl}) =
      _LevelApiService;

  @POST(AdminApiConstants.createLevel)
  Future<DataResponse> createLevel(@Body() Map<String, dynamic> body);

  @POST(AdminApiConstants.addMajor)
  @MultiPart()
  Future<DataResponse> addMajor(
    @Part() Map<String, dynamic> body , 
      
    );

  @POST(AdminApiConstants.addCourse)
  Future<DataResponse> addCourse(@Body() Map<String, dynamic> body);

  @GET(UserApiConstants.getLevels)
  Future<PaginatedDataResponse> getLevels();

  @GET(UserApiConstants.getMajors)
  Future<PaginatedDataResponse> getMajors(
      @Query('level') String level);

  @GET(UserApiConstants.getCourses)
  Future<PaginatedDataResponse> getCourses(
    @Query('level') String level,
    @Query('major') String major,
  );
}
