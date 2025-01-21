import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'report_repository.g.dart';

@RestApi()
abstract class ReportRepository {
  factory ReportRepository(Dio dio, {String? baseUrl}) = _ReportRepository;

  @POST('/reports')
  @Headers({'accessToken': 'true'})
  Future<void> reportUser(@Body() Map<String, dynamic> reportData);
}
