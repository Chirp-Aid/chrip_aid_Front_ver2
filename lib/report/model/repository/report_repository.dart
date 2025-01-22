// report_repository.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:chrip_aid/report/model/dto/report_dto.dart';

part 'report_repository.g.dart';

@RestApi()
abstract class ReportRepository {
  factory ReportRepository(Dio dio, {String? baseUrl}) = _ReportRepository;

  @POST('/reports')
  Future<void> submitReport(@Body() ReportDto reportDto);
}
