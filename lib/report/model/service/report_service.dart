import '../repository/report_repository.dart';

class ReportService {
  final ReportRepository repository;

  ReportService(this.repository);

  Future<void> reportUser({
    required String description,
    required String targetId,
    required String targetName,
    required String targetType,
    required String boardType,
    required String boardContent,
  }) async {
    final reportData = {
      'description': description,
      'target_id': targetId,
      'target_name': targetName,
      'target_type': targetType,
      'board_type': boardType,
      'board_content': boardContent,
    };
    print('Request Data: $reportData');
    try {
      await repository.reportUser(reportData);
    } catch (e) {
      print('Error reporting user: $e');
      rethrow;
    }
  }
}