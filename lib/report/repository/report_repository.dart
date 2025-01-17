import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/dto/report_dto.dart';
import 'package:chrip_aid/common/dio/dio.dart';

final reportRepositoryProvider = Provider((ref) => ReportRepository(ref.read(dioProvider)));

class ReportRepository {
  final Dio _dio;

  ReportRepository(this._dio); // 생성자 수정

  Future<void> createReport(ReportDTO report) async {
    try {
      final response = await _dio.post(
        '/reports', // Base URL은 dioProvider에서 설정됨
        data: report.toJson(),
      );
      if (response.statusCode == 200) {
        print('신고 생성 성공');
      }
    } on DioException catch (e) {
      print('신고 생성 실패: ${e.message}');
      rethrow;
    }
  }
}
