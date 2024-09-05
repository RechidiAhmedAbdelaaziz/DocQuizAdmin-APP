import 'package:admin_app/core/network/constants/adminapi.constants.dart';
import 'package:admin_app/core/network/constants/userapi.constants.dart';
import 'package:admin_app/core/network/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'question.api.g.dart';

@RestApi()
abstract class QuestionApiService {
  factory QuestionApiService(Dio dio, {String baseUrl}) =
      _QuestionApiService;

  @POST(AdminApiConstants.question)
  Future<DataResponse> createQuestion(
      @Body() Map<String, dynamic> body);

  @POST(AdminApiConstants.questionWithId)
  Future<DataResponse> updateQuestion(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(AdminApiConstants.questionWithId)
  Future<MessageResponse> deleteQuestion(
    @Path('id') String id,
  );

  @GET(UserApiConstants.question)
  Future<PaginatedDataResponse> getQuestions({
    @Queries() required Map<String, dynamic> queries,
  });
}
