import 'package:flutter/material.dart';

class ReportErrorScreen extends StatelessWidget {
  const ReportErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("신고 실패")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("신고를 제출하는 중 오류가 발생했습니다.", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("다시 시도"),
            ),
          ],
        ),
      ),
    );
  }
}
