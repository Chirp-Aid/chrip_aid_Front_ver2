import 'package:chrip_aid/root_tab/viewmodel/root_tab_viewmodel.dart';
import 'package:chrip_aid/common/component/custom_image_category_card.dart';
import 'package:chrip_aid/common/component/custom_description_card.dart';
import 'package:chrip_aid/common/component/custom_app_bar.dart';
import 'package:chrip_aid/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chrip_aid/root_tab/view/tab_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserHomeScreen extends TabScreen {
  @override
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootTabViewModel = ref.read(rootTabViewModelProvider);

    return Scaffold(
      // 기존 appBar 대신 body에 CustomAppBar 포함
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(), // 상단에 CustomAppBar 추가
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(kPaddingSmallSize),
              child: Center(
                child: SizedBox(
                  width: 600.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 앱 특징 왼쪽 정렬
                    children: [
                      CustomImageCategoryCard(
                        title: "Find Local Orphanages",
                        subtitle: "Search for orphanages in your area quickly and easily",
                        imagePath: "assets/image/pin.png", // 아이콘 경로
                        backgroundColor: Colors.pink.withOpacity(0.65), // 배경색
                        textColor: Colors.white,
                        onPressed: () {
                          rootTabViewModel.rootTabController.animateTo(1); // 보육원 검색 탭으로 이동
                        },
                      ),
                      const SizedBox(height: kPaddingMiddleSize),
                      CustomImageCategoryCard(
                        title: "Donation Certification Posts",
                        subtitle: "Check other users' donation activities\nand join the cause",
                        imagePath: "assets/image/giving.png", // 아이콘 경로
                        backgroundColor: Colors.blue.withOpacity(0.65), // 배경색
                        textColor: Colors.white,
                        onPressed: () {
                          rootTabViewModel.rootTabController.animateTo(2); // 인증글 확인 탭으로 이동
                        },
                      ),
                      const SizedBox(height: kPaddingMiddleSize),
                      CustomImageCategoryCard(
                        title: "Visit Request History",
                        subtitle: "Manage your visit request history for orphanages",
                        imagePath: "assets/image/calendar.png", // 아이콘 경로
                        backgroundColor: Colors.orange.withOpacity(0.65), // 배경색
                        textColor: Colors.white,
                        onPressed: () {
                          rootTabViewModel.rootTabController.animateTo(3); // 신청 내역 탭으로 이동
                        },
                      ),
                      const SizedBox(height: kPaddingLargeSize),
                      // 앱 특징 텍스트와 박스
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "App Features",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: kPaddingMiddleSize),
                      Center(
                        child: Container(
                          width: 600, // 전체 가로 크기
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0, // 회색 테두리
                            ),
                          ),
                          child: Column(
                            children: [
                              CustomDescriptionCard(
                                title: "크롤링 기반 기부금 책정",
                                description: "자동화된 크롤링으로 투명한 기부금 계산 및 관리",
                                onTap: () {
                                  print("첫 번째 설명 클릭됨");
                                },
                              ),
                              CustomDescriptionCard(
                                title: "실시간 채팅 피드백",
                                description: "사용자와 실시간으로 소통하며 문제를 해결하세요",
                                onTap: () {
                                  print("두 번째 설명 클릭됨");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: kPaddingLargeSize),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.itemMainColor,
        onPressed: () => context.go('/chatting'),
        child: const Icon(
          Icons.chat_bubble_outline_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
