import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket;

  void initializeSocket(String userId) {
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
          .build(),
    );

    socket!.connect();

    _setupSocketListeners();
  }

  void _setupSocketListeners() {
    if (socket == null) {
      print("Socket is not initialized. Unable to set up listeners.");
      return;
    }

    socket!.onConnect((_) {
      print('Connected to socket');
    });

    socket!.onDisconnect((reason) {
      print('Disconnected from socket: $reason');
    });

    socket!.on('connect_error', (error) {
      print('Connection error: $error');
    });

    socket!.on('connect_timeout', (_) {
      print('Connection timed out');
    });

    socket!.on('newMessage', (data) {
      print('Received new message: $data');
    });

    socket!.on('roomMessages', (data) {
      print('Received room messages: $data');
    });
  }

  // 채팅방 생성
  void createRoom(String userId, String orphanageUserId) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to create room.");
      return;
    }

    socket!.emit('createRoom', {
      'user_id': userId,
      'orphanage_user_id': orphanageUserId,
    });
  }

  // 메시지 전송
  void sendMessage(String sender, String type, String joinRoom, String content) {
    if (socket == null || !socket!.connected) {
      print("Socket is not connected. Unable to send message.");
      return;
    }

    socket!.emit('sendMessage', {
      'sender': sender,
      'type': type,
      'join_room': joinRoom,
      'content': content,
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

    socket!.emit('joinRoom', {'roomId': roomId});

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
