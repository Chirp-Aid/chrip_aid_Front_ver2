import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket; // nullable로 선언

  // 소켓 초기화
  void initializeSocket(String userId) {
    print('userId in initializeSocket : $userId');

    // 기존 소켓이 이미 연결된 경우 연결 해제
    if (socket != null && socket!.connected) {
      print("Existing socket detected. Disconnecting...");
      disconnect(); // 기존 소켓 정리
    }

    // 새 소켓 설정
    Map<String, dynamic> headers = {
      'x-user-id': userId,
    };

    socket = IO.io(
      'ws://3.34.17.191:3000',
      IO.OptionBuilder()
          .setTransports(['websocket']) // 웹소켓 사용 설정
          .disableAutoConnect() // 자동 연결 비활성화
          .setAuth(headers) // 헤더 설정
          .build(),
    );

    // 소켓 연결
    socket!.connect();

    // 소켓 이벤트 설정
    _setupSocketListeners();
  }

  // 소켓 이벤트 리스너 설정
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
