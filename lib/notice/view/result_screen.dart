import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // GoRouter 사용

class ResultScreen extends StatelessWidget {
  static String get routeName => 'resultPage'; // 라우트 이름 정의

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Complete'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thank you for your donation!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // 이전 화면으로 돌아가기
              },
              child: const Text('Back to Detail Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/'); // 메인 페이지로 이동
              },
              child: const Text('Go to Main Page'),
            ),
          ],
        ),
      ),
    );
  }
}