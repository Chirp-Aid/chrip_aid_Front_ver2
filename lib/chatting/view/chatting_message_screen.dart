import 'package:chrip_aid/member/model/service/member_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chrip_aid/common/styles/colors.dart';
import 'package:chrip_aid/orphanage/layout/detail_page_layout.dart';
import '../model/service/socket_service.dart';

class ChattingMessageScreen extends ConsumerStatefulWidget {
  final String chatRoomId;
  final String targetId;
  final String userId;
  final String userName;

  const ChattingMessageScreen({
    Key? key,
    required this.chatRoomId,
    required this.targetId,
    required this.userId,
    required this.userName,
  }) : super(key: key);

  @override
  _ChattingMessageScreenState createState() => _ChattingMessageScreenState();
}

class _ChattingMessageScreenState extends ConsumerState<ChattingMessageScreen> {
  final List<Map<String, dynamic>> _messages = [];
  late final SocketService _socketService;
  late final MemberInfoService memberInfoService;
  String userName = ''; // 사용자 이름만 유지

  @override
  void initState() {
    super.initState();

    memberInfoService = ref.read(memberInfoServiceProvider);

    _fetchUserInfo();
    _initializeSocketAndJoinRoom();
  }

  Future<void> _fetchUserInfo() async {
    try {
      // MemberInfoService를 사용하여 사용자 정보를 가져옵니다.
      print("Fetching member info...");
      final memberInfo = await memberInfoService.getMemberInfo();
      print("Fetched member info: ${memberInfo.entity}");

      if (mounted) {
        setState(() {
          userName = memberInfo.entity?.name ?? "Unknown User";
        });
      }
    } catch (e) {
      print("Error fetching member info: $e");
    }
  }


  Future<void> _initializeSocketAndJoinRoom() async {
    _socketService = SocketService();

    // 소켓 연결 완료 대기
    await _socketService.initializeSocket(widget.userId);
    print("Socket initialized successfully!");

    // 소켓 연결 후 채팅방 입장
    _socketService.joinRoom(widget.chatRoomId);

    // 이벤트 리스너 등록
    _initializeSocketListeners();

    _initializeUserDetails();
  }

  Future<void> _initializeUserDetails() async {
    print("Fetching user details...");
    final memberInfo = await memberInfoService.getMemberInfo();
    print("Fetched member info: ${memberInfo.entity}");
    try {
      setState(() {
        userName = memberInfo.entity?.name ?? "Unknown User";
      });

      print("Fetched userName: $userName");
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  void _initializeSocketListeners() {
    print("Initializing socket listeners...");
    // 새로운 메시지 수신 이벤트 처리
    _socketService.onNewMessage((message) {
      print("New message received: $message");
      setState(() {
        _messages.add(message);
      });
    });

    // roomMessages 이벤트 처리
    _socketService.socket!.on('roomMessages', (data) {
      print("Room messages received: $data");
      setState(() {
        // roomMessages 데이터를 _messages에 추가
        final List<Map<String, dynamic>> messages = List<Map<String, dynamic>>.from(data);
        _messages.addAll(messages);
      });
    });
  }

  @override
  void dispose() {
    print("Leaving room: ${widget.chatRoomId}");
    _socketService.leaveRoom(widget.chatRoomId);
    _socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: widget.targetId,
      titleColor: Colors.white,
      appBarBackgroundColor: CustomColor.buttonMainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      leadingColor: CustomColor.textReverseColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSentByMe = message['sender'] == userName;
                return _buildChatBubble(isSentByMe, message['content']);
              },
            ),
          ),
          _BottomInputField(
            chatRoomId: widget.chatRoomId,
            socketService: _socketService,
            userName: userName,
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(bool isSentByMe, String message) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: isSentByMe ? CustomColor.itemMainColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}


class _BottomInputField extends StatefulWidget {
  final String chatRoomId;
  final SocketService socketService;
  final String userName;

  const _BottomInputField({
    Key? key,
    required this.chatRoomId,
    required this.socketService,
    required this.userName,
  }) : super(key: key);

  @override
  State<_BottomInputField> createState() => _BottomInputFieldState();
}

class _BottomInputFieldState extends State<_BottomInputField> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      final messageContent = _controller.text;
      print("Sending message: $messageContent");

      // 메시지 전송
      widget.socketService.sendMessage(
        widget.userName,
        "USER", // 사용자 타입은 고정된 문자열로 설정
        widget.chatRoomId,
        messageContent,
      );

      // 메시지 입력 필드 초기화
      _controller.clear();
    } else {
      print("Message content is empty, nothing to send.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blueAccent),
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
