// report_repository.dart
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:chrip_aid/report/model/dto/report_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'package:chrip_aid/common/dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'report_repository.g.dart';

final reportRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return ReportRepository(dio);
});

@RestApi()
abstract class ReportRepository {
  factory ReportRepository(Dio dio, {String? baseUrl}) = _ReportRepository;

  @POST('/reports')
  @Headers({'accessToken': 'true'})
  Future<void> submitReport(@Body() ReportDto reportDto);
}
