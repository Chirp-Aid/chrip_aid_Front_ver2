import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/report_viewmodel.dart';

class ReportScreen extends ConsumerWidget {
  static String get routeName => 'reportPage';

  final int targetId;
  final String targetName;
  final String targetType;
  final String boardType;
  final String boardContent;

  const ReportScreen({
    Key? key,
    required this.targetId,
    required this.targetName,
    required this.targetType,
    required this.boardType,
    required this.boardContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(reportViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('신고 작성'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 대상 정보
            Text(
              '대상: $targetName ($targetType)',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '게시판 유형: $boardType',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            Text(
              '게시판 내용:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              boardContent,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // 신고 사유 입력
            const Text(
              '신고 사유',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: viewModel.descriptionController,
              decoration: const InputDecoration(
                hintText: '신고 사유를 입력하세요.',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),

            // 신고 버튼
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  await viewModel.submitReport(
                    targetId: targetId,
                    targetName: targetName,
                    targetType: targetType,
                    boardType: boardType,
                    boardContent: boardContent,
                  );
                  Navigator.pop(context); // 성공 시 화면 종료
                },
                child: const Text(
                  '신고하기',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
