import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/dto/report_dto.dart';
import '../service/report_service.dart';

final reportViewModelProvider = Provider((ref) => ReportViewModel(ref));

class ReportViewModel {
  final Ref ref;
  final TextEditingController descriptionController = TextEditingController();

  ReportViewModel(this.ref);

  Future<void> submitReport({
    required int targetId,
    required String targetName,
    required String targetType,
    required String boardType,
    required String boardContent,
  }) async {
    final service = ref.read(reportServiceProvider);
    final report = ReportDTO(
      description: descriptionController.text,
      targetId: targetId,
      targetName: targetName,
      targetType: targetType,
      boardType: boardType,
      boardContent: boardContent,
    );
    await service.createReport(report);
  }
}
