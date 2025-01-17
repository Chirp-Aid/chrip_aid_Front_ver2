import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/dto/report_dto.dart';
import '../repository/report_repository.dart';

final reportServiceProvider = Provider((ref) => ReportService(ref));

class ReportService {
  final Ref ref;

  ReportService(this.ref);

  Future<void> createReport(ReportDTO report) async {
    final repository = ref.read(reportRepositoryProvider);
    await repository.createReport(report);
  }
}
