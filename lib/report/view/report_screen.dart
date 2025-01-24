import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/report_viewmodel.dart';

class ReportScreen extends ConsumerWidget {
  static const routeName = '/report';

  final Map<String, String> reportData;

  const ReportScreen({super.key, required this.reportData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportViewModel = ref.watch(reportViewModelProvider); // ViewModel 주입
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('신고하기')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Target ID: ${reportData['targetId']}'),
            Text('Target Name: ${reportData['targetName']}'),
            Text('Target Type: ${reportData['targetType']}'),
            Text('Board Type: ${reportData['boardType']}'),
            Text('Board Content: ${reportData['boardContent']}'),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: '신고 내용',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: reportViewModel.isLoading
                  ? null
                  : () async {
                await reportViewModel.submitReport(
                  reportData: reportData,
                  description: descriptionController.text,
                );
              },
              child: reportViewModel.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
