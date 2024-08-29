import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'exam.api.g.dart';

@RestApi()
abstract class ExamApiService {
  factory ExamApiService(Dio dio, {String baseUrl}) =
      _ExamApiService;

  @POST(AdminApiConstants.exam)
  Future<DataResponse> createExam(@Body() Map<String, dynamic> body);

  @PATCH(AdminApiConstants.examWithID)
  Future<DataResponse> updateExam(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @GET(UserApiConstants.getExams)
  Future<PaginatedDataResponse> getExams({
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

}
