import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessagesNotifier extends Notifier<List<Map<String, dynamic>>> {
  @override
  List<Map<String, dynamic>> build() => [];

  void addMessage(Map<String, dynamic> message) {
    state = [...state, message]; // 기존 메시지 목록에 새로운 메시지를 추가
  }

  void addMessages(List<Map<String, dynamic>> messages) {
    state = [...state, ...messages]; // 기존 메시지 목록에 여러 메시지를 추가
  }

  void clearMessages() {
    state = []; // 메시지 목록 초기화
  }
}

final chatMessagesProvider =
NotifierProvider<ChatMessagesNotifier, List<Map<String, dynamic>>>(
      () => ChatMessagesNotifier(),
);
