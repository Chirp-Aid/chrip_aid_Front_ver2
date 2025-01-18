import 'package:chrip_aid/auth/model/service/auth_service.dart';
import 'package:chrip_aid/common/styles/styles.dart';
import 'package:chrip_aid/common/value_state/component/value_state_listener.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/member/model/service/member_info_service.dart';
import 'package:chrip_aid/orphanage/component/custom_date_picker.dart';
import 'package:chrip_aid/orphanage/component/custom_product_box.dart';
import 'package:chrip_aid/orphanage/component/custom_text_field.dart';
import 'package:chrip_aid/orphanage/component/orphanage_text_form.dart';
import 'package:chrip_aid/orphanage/const/tabs.dart';
import 'package:chrip_aid/orphanage/layout/detail_page_layout.dart';
import 'package:chrip_aid/orphanage/viewmodel/orphange_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../chatting/model/service/socket_service.dart';

class OrphanageDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'detailPage';
  final int orphanageId;
  final String orphanageUserId;

  const OrphanageDetailScreen({super.key, required this.orphanageId, required this.orphanageUserId});

  @override
  ConsumerState<OrphanageDetailScreen> createState() =>
      _OrphanageDetailPageState();
}

class _OrphanageDetailPageState extends ConsumerState<OrphanageDetailScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  IconData fabIcon = Icons.shopping_cart;
  Color tabColor = Colors.white;
  Color tabTextColor = Colors.black;
  late final MemberInfoService memberInfoService;
  late String userId='';

  late final OrphanageDetailViewModel viewModel;
  late final SocketService _socketService;

  @override
  void initState() {
    super.initState();
    memberInfoService = ref.read(memberInfoServiceProvider);
    _fetchUserInfo();
    tabController = TabController(length: TABS.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        fabIcon = tabController.index == 0
            ? Icons.shopping_cart
            : Icons.edit_document;
        tabColor =
            tabController.index == 0 ? Colors.white : CustomColor.mainColor;
        tabTextColor = tabController.index == 0 ? Colors.black : Colors.white;
      });
    });

    viewModel = ref.read(orphanageDetailViewModelProvider)
      ..getInfo(widget.orphanageId);


    // SocketService 초기화
    _socketService = SocketService();
  }

  void _navigateToChattingPage(BuildContext context) async {
    try {
      // Ensure _socketService is initialized
      if (_socketService == null) {
        print("SocketService is not initialized. Initializing now...");
        _socketService = SocketService();
      }

      // Ensure any existing socket connection is terminated
      if (_socketService.socket != null && _socketService.socket!.connected) {
        print("Terminating existing socket connection...");
        _socketService.disconnect(); // 연결 종료
      }

      // Ensure the socket is connected
      if (_socketService.socket == null || !_socketService.socket!.connected) {
        print("Socket is not connected. Connecting now...");
        await _socketService.initializeSocket(userId);
        print("Socket connected successfully.");
      }

      // Create room
      print("Creating chat room...");
      _socketService.createRoom(userId, widget.orphanageUserId);

      // Listen for room creation and navigate
      _socketService.onRoomCreated((roomId) {
        print("Room created successfully: $roomId");

        // Navigate to the chat room
        context.push(
          '/chatting',
          extra: {'roomId': roomId},
        );

        // After navigation, disconnect the socket
        print("Disconnecting socket after navigation...");
        _socketService.disconnect();
      });
    } catch (e) {
      print("Error during navigation: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to create or join chat room. Please try again.")),
      );
    }
  }





  Future<void> _fetchUserInfo() async {
    try {
      // MemberInfoService를 사용하여 사용자 정보를 가져옵니다.
      print("Fetching member info...");
      final memberInfo = await memberInfoService.getMemberInfo();
      print("Fetched member info: ${memberInfo.entity}");
      userId = memberInfo.entity?.userId ?? "Unknown User";

      print('userId : $userId');
    } catch (e) {
      print("Error fetching member info: $e");
    }
  }

  void _navigateToChatRoom(String roomId) {
    context.push(
      '/chatting',
      extra: {'roomId': roomId},
    );
  }


  @override
  Widget build(BuildContext context) {
    final tabs = [0, 1];
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
      },
      child: DetailPageLayout(
        leadingColor: CustomColor.textReverseColor,
        floatingActionButton: SizedBox(
          height: 140,
          width: 70,
          child:Transform.translate(offset: Offset(0,-10),
          child: Column(
            children: [
              FloatingActionButton(
                foregroundColor: CustomColor.mainColor,
                backgroundColor: CustomColor.backGroundSubColor,
                shape: const CircleBorder(
                  side: BorderSide(color: CustomColor.mainColor, width: 2.0),
                ),
                onPressed: () => _navigateToChattingPage(context),
                child: Icon(
                  Icons.add_comment,
                  size: kIconLargeSize,
                ),
              ),
              SizedBox(height: 10.0,),
              FloatingActionButton(
                foregroundColor: CustomColor.mainColor,
                backgroundColor: CustomColor.backGroundSubColor,
                shape: const CircleBorder(
                  side: BorderSide(color: CustomColor.mainColor, width: 2.0),
                ),
                onPressed: () =>
                    viewModel.postOrGoBasket(tabController.index, context),
                child: Icon(
                  fabIcon,
                  size: kIconLargeSize,
                ),
              ),
            ],
          ),
          )
        ),
        child: ValueStateListener(
          state: viewModel.orphanageDetailState,
          successBuilder: (_, state) => SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.network(
                        state.value!.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingMiddleSize,
                          vertical: kPaddingMiniSize),
                      child: Column(
                        children: [
                          CustomTextField(
                            text: state.value!.orphanageName,
                            textSize: kTextMediumSize,
                          ),
                          CustomTextField(
                            iconData: Icons.location_on,
                            text: state.value!.address,
                          ),
                          CustomTextField(
                            iconData: Icons.phone,
                            text: state.value!.phoneNumber,
                          ),
                          CustomTextField(
                            iconData: Icons.person,
                            text: state.value!.name ?? '',
                          ),
                          CustomTextField(
                            iconData: Icons.monitor,
                            text: state.value!.homepageLink,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 5.0,
                  color: CustomColor.disabledColor.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kPaddingMiddleSize,
                    right: kPaddingMiddleSize,
                    top: kPaddingMiniSize,
                    bottom: kPaddingSmallSize,
                  ),
                  child: Column(
                    children: [
                      const CustomTextField(
                          iconData: Icons.description, text: "소개글"),
                      Text(
                        state.value!.description,
                        style: kTextContentStyleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 5.0,
                  color: CustomColor.disabledColor.withOpacity(0.5),
                ),
                DefaultTabController(
                  length: tabs.length,
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        indicatorColor: CustomColor.mainColor,
                        unselectedLabelColor: Colors.black,
                        labelColor: tabTextColor,
                        labelStyle: kTextMainStyleMedium,
                        indicator: BoxDecoration(
                          color: tabColor,
                        ),
                        tabs: tabs
                            .map((e) => SizedBox(
                                  height: 40.0,
                                  child: Center(child: Text(TABS[e % 2].label)),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(
                            controller: tabController,
                            //physics: NeverScrollableScrollPhysics(),
                            children: [
                              if (state.value!.requests != null)
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.value!.requests!.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        state.value!.requests![index];
                                    return CustomProductBox(
                                      requiredId: item.requestId,
                                      photo: item.productPhoto,
                                      name: item.productName,
                                      description: item.message,
                                      price: item.price,
                                      requestCount: item.requestCount,
                                      supportCount: item.supportCount,
                                      progress:
                                          item.supportCount / item.requestCount,
                                    );
                                  },
                                  padding: const EdgeInsets.only(bottom: 100),
                                )
                              else
                                Container(),
                              Container(
                                color: CustomColor.mainColor,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: kPaddingMiddleSize,
                                    ),
                                    OrphanageDateForm(
                                      title: "일시",
                                      iconData: Icons.calendar_today,
                                      controller: viewModel.dateController,
                                    ),
                                    const SizedBox(
                                      height: kPaddingSmallSize,
                                    ),
                                    OrphanageTextForm(
                                      title: "사유",
                                      iconData: Icons.description,
                                      controller:
                                      viewModel.purposeTextController,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
