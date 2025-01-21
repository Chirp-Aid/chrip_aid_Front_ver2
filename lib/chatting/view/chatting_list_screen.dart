import 'package:chrip_aid/auth/model/state/authority_state.dart';
import 'package:chrip_aid/common/component/custom_chats_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../common/styles/colors.dart';
import '../../common/styles/sizes.dart';
import '../../orphanage/layout/detail_page_layout.dart';
import '../model/entity/chat_room_entity.dart';
import '../model/service/chatting_list_service.dart';

class ChatRoomListNotifier extends StateNotifier<List<ChatRoomEntity>?> {
  final ChattingListService chatService;

  ChatRoomListNotifier(this.chatService) : super(null);

  Future<void> fetchChatRooms() async {
    final rooms = await chatService.getAllChatRooms();
    final memberAuth = AuthorityState();

    if (rooms.entity != null && rooms.entity!.isNotEmpty) {
      print('authrity : ${memberAuth.value.toString()}');
      if (memberAuth.value.toString() == 'orphanages') {
        final filteredRooms = await chatService.getChatRoomByOrphanageId();
        state = filteredRooms.entity;
      } else if (memberAuth.value.toString() == 'users') {
        final filteredRooms = await chatService.getChatRoomByUserId();
        state = filteredRooms.entity;
      }
    } else {
      state = []; // 채팅방이 없을 경우 빈 리스트 설정
    }
  }
}

final chatRoomsProvider = StateNotifierProvider<ChatRoomListNotifier, List<ChatRoomEntity>?>(
      (ref) {
    final chatService = ref.read(chattingListServiceProvider);
    return ChatRoomListNotifier(chatService);
  },
);

class ChattingListScreen extends ConsumerStatefulWidget {
  static String get routeName => 'chatting';

  const ChattingListScreen({Key? key}) : super(key: key);

  @override
  _ChattingListScreenState createState() => _ChattingListScreenState();
}

class _ChattingListScreenState extends ConsumerState<ChattingListScreen> {
  @override
  void initState() {
    super.initState();
    // 페이지 로드 시 채팅방 목록 가져오기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatRoomsProvider.notifier).fetchChatRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatRooms = ref.watch(chatRoomsProvider);
    final memberAuth = AuthorityState();

    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: 'Chats',
      titleColor: CustomColor.textReverseColor,
      appBarBackgroundColor: CustomColor.buttonMainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      leadingColor: CustomColor.textReverseColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => {context.go('/')},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, size: kIconSmallSize),
          color: CustomColor.textReverseColor,
          splashRadius: kIconSmallSize,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: kPaddingMiddleSize),
      ],
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Expanded(
            child: Builder(
              builder: (context) {
                if (chatRooms == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (chatRooms.isEmpty) {
                  return const Center(child: Text('채팅방이 없습니다.'));
                } else {
                  return ListView.builder(
                    itemCount: chatRooms.length,
                    itemBuilder: (context, index) {
                      final room = chatRooms[index];
                      return CustomChatsList(
                        chat_room_id: room.chatRoomId,
                        name: room.orphanageUser.name,
                        userId: memberAuth.value.toString()=='users'? room.user.userId : room.orphanageUser.orphanageUserId,
                        userName: memberAuth.value.toString()=='users'? room.user.name : room.orphanageUser.name,
                        targetId: memberAuth.value.toString()=='users'? room.orphanageUser.orphanageUserId : room.user.userId,
                        targetName: memberAuth.value.toString()=='users'? room.orphanageUser.name : room.user.name,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
