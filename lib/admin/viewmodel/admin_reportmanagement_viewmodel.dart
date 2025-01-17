import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/value_state/state/value_state.dart';
import '../model/service/admin_reportmanagement_service.dart';
import '../model/entity/report_entity.dart';

final adminReportManagementViewModelProvider =
Provider((ref) => AdminReportManagementViewModel(ref));

class AdminReportManagementViewModel {
  final Ref ref;
  late final AdminReportmanagementService _adminReportManagementService;

  // 신고 목록 상태를 관리하는 ValueStateNotifier
  final reportsState = ValueStateNotifier<List<ReportEntity>>();

  AdminReportManagementViewModel(this.ref) {
    _adminReportManagementService =
        ref.read(adminReportManagementServiceProvider);
  }

  // 모든 신고 목록 가져오기
  Future<void> fetchAllReports() async {
    try {
      reportsState.loading(); // 로딩 상태 설정
      final response = await _adminReportManagementService.getAllReports();

      if (response.isSuccess) {
        final reports = response.entity ?? [];
        reportsState.success(value: reports, message: '신고 목록을 불러왔습니다.');
      } else {
        reportsState.error(message: response.message ?? '알 수 없는 오류가 발생했습니다.');
      }
    } catch (e) {
      reportsState.error(message: e.toString()); // 에러 상태 설정
    }
  }

  // 신고 삭제
  Future<void> deleteReport(String id) async {
    try {
      await _adminReportManagementService.deleteReport(id);

      // 삭제된 신고를 제외한 목록으로 상태 갱신
      final updatedReports = reportsState.value
          ?.where((report) => report.reportId.toString() != id)
          .toList();
      reportsState.success(value: updatedReports ?? [], message: '신고가 삭제되었습니다.');
    } catch (e) {
      reportsState.error(message: '삭제 중 오류가 발생했습니다: $e');
    }
  }
}
