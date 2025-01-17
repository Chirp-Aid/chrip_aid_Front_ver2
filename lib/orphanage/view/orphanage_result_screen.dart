import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrphanageResultScreen extends StatelessWidget {
  static const routeName = '/orphanage_result';

  final int statusCode; // HTTP 상태 코드를 전달받음

  const OrphanageResultScreen({Key? key, required this.statusCode}) : super(key: key);

  String getMessageByStatusCode() {
    switch (statusCode) {
      case 201:
        return "후원 감사합니다!";
      case 401:
        return "권한이 없습니다. 다시 로그인 해주세요.";
      case 404:
        return "해당 요청을 찾을 수 없습니다.";
      case 409:
        return "이미 기부가 완료되었거나 요청을 확인해주세요.";
      default:
        return "알 수 없는 오류가 발생했습니다.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("결과"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getMessageByStatusCode(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/'); // 메인 페이지로 이동
              },
              child: const Text("메인 페이지로"),
            ),
          ],
        ),
      ),
    );
  }
}
