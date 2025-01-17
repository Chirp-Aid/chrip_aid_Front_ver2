import 'package:chrip_aid/common/styles/styles.dart';
import 'package:chrip_aid/common/utils/log_util.dart';
import 'package:chrip_aid/common/value_state/component/value_state_listener.dart';
import 'package:chrip_aid/orphanage/component/custom_basket_product_box.dart';
import 'package:chrip_aid/orphanage/layout/detail_page_layout.dart';
import 'package:chrip_aid/orphanage/viewmodel/orphanage_basket_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:chrip_aid/notice/view/notice_screen.dart';

class OrphanageBasketScreen extends ConsumerStatefulWidget {
  static String get routeName => 'basket';

  const OrphanageBasketScreen({super.key});

  @override
  OrphanageBasketScreenState createState() => OrphanageBasketScreenState();
}

class OrphanageBasketScreenState extends ConsumerState<OrphanageBasketScreen> {
  late final OrphanageBasketViewModel viewModel;
  bool isAgreementConfirmed = false;

  @override
  void initState() {
    super.initState();
    logging("OrphanageBasketScreenState", "initState");
    viewModel = ref.read(orphanageBasketViewModelProvider)..getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return DetailPageLayout(
      title: "장바구니",
      child: ValueStateListener(
        state: viewModel.orphanageBasketState,
        successBuilder: (_, state) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.value!.length,
                itemBuilder: (context, index) {
                  final item = state.value![index];
                  return CustomBasketProductBox(
                      basketProductId: item.basketProductId,
                      productName: item.productName,
                      count: item.count,
                      price: item.price,
                      orphanageName: item.orphanageName,
                      photo: item.productPhoto,
                      onCountUpdate: (int updatedCount) {
                        viewModel.updateBasket(
                          updatedCount,
                          item.requestId,
                        );
                      },
                      deleteBasket: () {
                        viewModel.deleteBasket(item.basketProductId);
                      });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(kPaddingMiddleSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        "합계",
                        style: kTextContentStyleMedium,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${NumberFormat.decimalPattern().format(viewModel.total)} 원",
                            style: kTextContentStyleMedium,
                          )
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: kPaddingMiddleSize,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isAgreementConfirmed
                              ? () {
                            viewModel.payment(context);
                          }
                              : () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return NoticeScreen(
                                  onConfirm: () {
                                    setState(() {
                                      isAgreementConfirmed = true;
                                    });
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: isAgreementConfirmed
                                ? Colors.black
                                : Colors.grey[700],
                            padding: const EdgeInsets.symmetric(
                              vertical: kPaddingMiddleSize,
                            ),
                          ),
                          child: Text(
                            isAgreementConfirmed ? "구매하기" : "약관 확인",
                            style: kTextReverseStyleMiddle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}