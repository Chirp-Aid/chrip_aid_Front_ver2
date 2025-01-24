import 'package:flutter/material.dart';
import '../model/dto/report_dto.dart';
import '../model/service/report_service.dart';

class ReportViewModel extends ChangeNotifier {
  final ReportService reportService;

  ReportViewModel(this.reportService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> submitReport({
    required Map<String, String> reportData,
    required String description,
  }) async {
    final reportDto = ReportDto(
      description: description,
      targetId: reportData['targetId']!,
      targetName: reportData['targetName']!,
      targetType: reportData['targetType']!,
      boardType: reportData['boardType']!,
      boardContent: reportData['boardContent']!,
    );

    _isLoading = true;
    notifyListeners();

    try {
      await reportService.submitReport(reportDto);
      print('신고가 성공적으로 접수되었습니다.');
    } catch (e) {
      print('신고 접수 중 에러 발생: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
