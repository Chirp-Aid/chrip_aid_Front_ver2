import 'package:flutter/material.dart';
import '../viewmodel/report_viewmodel.dart';
import '../model/service/report_service.dart';
import '../model/repository/report_repository.dart';
import 'package:dio/dio.dart';

class ReportScreen extends StatefulWidget {
  static const routeName = '/report';

  final Map<String, String> reportData;

  const ReportScreen({super.key, required this.reportData});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late final ReportViewModel reportViewModel;
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final dio = Dio(); // Dio 인스턴스 생성
    final repository = ReportRepository(dio);
    final service = ReportService(repository);
    reportViewModel = ReportViewModel(service);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('신고하기')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Target ID: ${widget.reportData['targetId']}'),
            Text('Target Name: ${widget.reportData['targetName']}'),
            Text('Target Type: ${widget.reportData['targetType']}'),
            Text('Board Type: ${widget.reportData['boardType']}'),
            Text('Board Content: ${widget.reportData['boardContent']}'),
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
                  reportData: widget.reportData,
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
