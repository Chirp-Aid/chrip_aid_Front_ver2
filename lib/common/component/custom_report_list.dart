import 'package:flutter/material.dart';

class CustomReportList extends StatelessWidget {
  final String title; // 제목 또는 신고 내용
  final String reporterName; // 신고자 이름
  final String targetName; // 피신고자 이름 또는 대상 이름
  final String description;
  final String content;
  final VoidCallback onTap; // 카드 클릭 시 동작
  final VoidCallback? onDelete;

  const CustomReportList({
    Key? key,
    required this.title,
    required this.reporterName,
    required this.targetName,
    required this.description,
    required this.content,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    reporterName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 공간을 균등 배치
              children: [
                SizedBox(
                  width: 100.0, // 고정된 너비
                  child: Text(
                    targetName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                      overflow: TextOverflow.ellipsis, // 길면 말줄임표 처리
                    ),
                    maxLines: 1, // 한 줄로 제한
                  ),
                ),
                const SizedBox(height: 8.0),
                IconButton(
                  color: Colors.red,
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
