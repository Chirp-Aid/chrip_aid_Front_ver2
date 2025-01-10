import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

class SocketService {
  IO.Socket? socket;

  Future<void> initializeSocket(String userId) async {
    print('userId in initializeSocket : $userId');

    if (socket != null && socket!.connected) {
      print("Existing socket detected. Disconnecting...");
      disconnect();
    }

    Map<String, dynamic> headers = {
      'x-user-id': userId,
    };

    socket = IO.io(
      'ws://3.34.17.191:3000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders(headers)
          .setReconnectionAttempts(5)
          .setReconnectionDelay(2000)
          .build(),
    );

    final completer = Completer<void>();

    // 연결 이벤트 등록
    socket!.onConnect((_) {
      print('Connected to socket');
      completer.complete();
    });

    socket!.onConnectError((error) {
      print('Connection error: $error');
      completer.completeError(error);
    });

    socket!.on('connect_timeout', (_) {
      print('Connection timed out');
      completer.completeError('Connection timed out');
    });

    socket!.connect();

    print('Waiting for socket connection...');
    await completer.future; // 연결 완료 대기
    print('Socket connection established!');

    _setupSocketListeners();
  }

  void _setupSocketListeners() {
    if (socket == null) {
      print("Socket is not initialized. Unable to set up listeners.");
      return;
    }

    socket!.onDisconnect((reason) {
      print('Disconnected from socket: $reason');
    });

    socket!.on('connect_error', (error) {
      print('Connection error: $error');
    });

    // Add other event listeners as needed
  }

  // 채팅방 생성
  void createRoom(String userId, String orphanageUserId) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to create room.");
      return;
    }

    socket!.emitWithAck('createRoom', {'user_id': userId, 'orphanage_user_id': orphanageUserId}, ack: (response) {
      print('Room created successfully: $response');
    });
  }

  // 메시지 전송
  void sendMessage(String sender, String type, String joinRoom, String content) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to send message.");
      return;
    }

    socket!.emitWithAck('sendMessage', {
      'sender': sender,
      'type': type,
      'join_room': joinRoom,
      'content': content,
    }, ack: (response) {
      print('Send Messages successfully : $response');
    });
  }

  // 새로운 메시지 수신
  void onNewMessage(Function(dynamic) callback) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to set newMessage listener.");
      return;
    }

    socket!.off('newMessage'); // 이전 리스너 제거
    socket!.on('newMessage', callback);
  }

  // 채팅방 입장
  void joinRoom(String roomId) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to join room.");
      return;
    }

    socket!.emitWithAck('joinRoom', {'roomId': roomId}, ack: (response) {
      print('Join Successfully : $response');
    });

    socket!.off('roomMessages'); // 이전 roomMessages 리스너 제거
    socket!.on('roomMessages', (data) {
      print('Joined room and received messages: $data');
    });
  }

  // 채팅방 퇴장
  void leaveRoom(String roomId) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to leave room.");
      return;
    }

    socket!.emit('leaveRoom', {'roomId': roomId});
  }

  // 연결 해제 및 리스너 정리
  void disconnect() {
    if (socket == null) {
      print("Socket is not initialized. Nothing to disconnect.");
      return;
    }

    print("Disconnecting socket...");
    socket!.disconnect();
    socket!.clearListeners();
    socket = null; // 소켓 객체 제거
  }
}
