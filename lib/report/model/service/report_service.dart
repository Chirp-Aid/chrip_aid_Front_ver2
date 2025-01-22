import 'package:chrip_aid/report/model/repository/report_repository.dart';
import 'package:chrip_aid/report/model/dto/report_dto.dart';

class ReportService {
  final ReportRepository reportRepository;

  ReportService(this.reportRepository);

  Future<void> submitReport(ReportDto reportDto) async {
    try {
      await reportRepository.submitReport(reportDto);
      print('신고가 성공적으로 접수되었습니다.');
    } catch (e) {
      print('신고 접수 중 에러 발생: $e');
      rethrow;
    }
  }
}
