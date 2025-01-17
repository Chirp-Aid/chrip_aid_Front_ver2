import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrphanageResultScreen extends StatelessWidget {
  static const routeName = '/orphanage_result';

  const OrphanageResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 64,
            ),
            const SizedBox(height: 20),
            const Text(
              "후원 감사합니다!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200, // 버튼 너비 설정
              child: ElevatedButton(
                onPressed: () {
                  context.go('/'); // 메인 페이지로 이동
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 버튼 색상
                  foregroundColor: Colors.white, // 텍스트 색상
                  padding: const EdgeInsets.symmetric(vertical: 15), // 버튼 높이
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 둥근 모서리
                  ),
                  elevation: 5, // 그림자 효과
                ),
                child: const Text(
                  "메인 페이지로",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
