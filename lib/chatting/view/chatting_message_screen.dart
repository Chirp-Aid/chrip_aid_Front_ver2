import 'package:chrip_aid/member/model/service/member_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chrip_aid/common/styles/colors.dart';
import 'package:chrip_aid/orphanage/layout/detail_page_layout.dart';
import '../model/notifier/chat_message_notifier.dart';
import '../model/service/socket_service.dart';

class ChattingMessageScreen extends ConsumerStatefulWidget {
  final String chatRoomId;
  final String targetId;
  final String targetName;
  final String userId;
  final String userName;

  const ChattingMessageScreen({
    Key? key,
    required this.chatRoomId,
    required this.targetId,
    required this.targetName,
    required this.userId,
    required this.userName,
  }) : super(key: key);

  @override
  _ChattingMessageScreenState createState() => _ChattingMessageScreenState();
}

class _ChattingMessageScreenState extends ConsumerState<ChattingMessageScreen> {
  late final SocketService _socketService;
  late final MemberInfoService memberInfoService;
  String userName = '';

  @override
  void initState() {
    super.initState();

    memberInfoService = ref.read(memberInfoServiceProvider);

    _fetchUserInfo();
    _initializeSocketAndJoinRoom();
  }

  Future<void> _fetchUserInfo() async {
    try {
      final memberInfo = await memberInfoService.getMemberInfo();
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

    print('userId : ${widget.userId}');
    print('userName : ${widget.userName}');
    print('targetId : ${widget.targetId}');
    print('targetName : ${widget.targetName}');

    await _socketService.initializeSocket(widget.userId);
    print("Socket initialized successfully!");

    await _fetchRoomMessages(widget.chatRoomId);

    ref.read(chatMessagesProvider.notifier).clearMessages();

    _socketService.joinRoom(widget.chatRoomId);
    _initializeSocketListeners();
  }
  Future<void> _fetchRoomMessages(String roomId) async {
    _socketService.socket?.emit('fetchRoomMessages', {'roomId': roomId});

    _socketService.socket?.on('roomMessages', (data) {
      print("Room messages received: $data");
      final List<Map<String, dynamic>> messages =
      List<Map<String, dynamic>>.from(data);
      ref.read(chatMessagesProvider.notifier).addMessages(messages);
    });
  }

  void _initializeSocketListeners() {
    _socketService.socket?.off('newMessage');
    _socketService.socket?.off('roomMessages');
    _socketService.onNewMessage((message) {
      print("New message received: $message");
      ref.read(chatMessagesProvider.notifier).addMessage(message); // 메시지 추가
    });

    _socketService.socket?.on('roomMessages', (data) {
      print("Room messages received: $data");
      final List<Map<String, dynamic>> messages =
      List<Map<String, dynamic>>.from(data);
      ref.read(chatMessagesProvider.notifier).addMessages(messages); // 여러 메시지 추가
    });
  }

  @override
  void dispose() {
    _socketService.leaveRoom(widget.chatRoomId);
    _socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatMessagesProvider); // 메시지 상태 가져오기

    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: widget.targetName,
      titleColor: Colors.white,
      appBarBackgroundColor: CustomColor.buttonMainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      leadingColor: CustomColor.textReverseColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
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

class _BottomInputField extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _controller = TextEditingController();

    void _sendMessage() {
      if (_controller.text.trim().isNotEmpty) {
        final messageContent = _controller.text;

        // 메시지 전송
        socketService.sendMessage(
          userName,
          "USER", // 사용자 타입은 고정된 문자열로 설정
          chatRoomId,
          messageContent,
        );

        // 입력 필드 초기화
        _controller.clear();
      }
    }

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
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
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
