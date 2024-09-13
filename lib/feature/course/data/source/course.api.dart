import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'course.api.g.dart';

@RestApi()
abstract class CourseApi {
  factory CourseApi(Dio dio, {String baseUrl}) = _CourseApi;

  @GET(UserApiConstants.courses)
  Future<PaginatedDataResponse> getCourses(
    {
      @Query('majorId') String? majorId,
    }
  );

  @POST(AdminApiConstants.courseWithMajorId)
  Future<DataResponse> createCourse(@Path('majorId') String majorId,
      @Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.courseWithId)
  Future<DataResponse> updateCourse(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(AdminApiConstants.courseWithId)
  Future<MessageResponse> deleteCourse(
    @Path('id') String id,
  );
}
