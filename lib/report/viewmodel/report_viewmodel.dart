import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../model/service/report_service.dart';
import '../model/repository/report_repository.dart';

final reportViewModelProvider = Provider((ref) {
  final dio = Dio(); // Configure Dio instance as needed
  final repository = ReportRepository(dio);
  return ReportViewModel(ReportService(repository));
});

class ReportViewModel {
  final ReportService service;

  ReportViewModel(this.service);

  Future<void> sendReport({
    required String description,
    required String targetId,
    required String targetName,
    required String targetType,
    required String boardType,
    required String boardContent,
  }) async {
    if (description.isEmpty) {
      throw Exception('신고 사유를 입력하세요.');
    }
    try {
      await service.reportUser(
        description: description,
        targetId: targetId,
        targetName: targetName,
        targetType: targetType,
        boardType: boardType,
        boardContent: boardContent,
      );
      print('Report successfully sent');
    } catch (e) {
      print('Failed to send report: $e');
      throw e;
    }
  }
}
