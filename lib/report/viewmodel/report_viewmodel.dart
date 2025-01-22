import 'package:http/http.dart' as http;
import 'dart:convert';

class ReportViewModel {
  Future<void> submitReport({
    required Map<String, String> reportData,
    required String description,
  }) async {
    final reportBody = {
      ...reportData,
      'description': description,
    };

    try {
      final response = await http.post(
        Uri.parse('http://3.34.17.191:3000/reports'),
        headers: {
          'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(reportBody),
      );

      if (response.statusCode == 200) {
        print('Report submitted successfully');
      } else {
        print('Failed to submit report: ${response.body}');
      }
    } catch (e) {
      print('Error submitting report: $e');
    }
  }
}
