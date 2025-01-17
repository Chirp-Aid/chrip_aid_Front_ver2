import 'package:chrip_aid/common/kakao/kakao_pay.dart';
import 'package:chrip_aid/common/value_state/util/value_state_util.dart';
import 'package:chrip_aid/orphanage/model/dto/donate_delete_dto.dart';
import 'package:chrip_aid/orphanage/model/dto/donate_request_dto.dart';
import 'package:chrip_aid/orphanage/model/entity/add_basket_item_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_basket_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/update_basket_item_entity.dart';
import 'package:chrip_aid/orphanage/model/service/orphanage_basket_service.dart';
import 'package:chrip_aid/orphanage/model/state/orphanage_detail_state.dart';
import 'package:chrip_aid/orphanage/view/orphanage_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final orphanageBasketViewModelProvider =
    Provider((ref) => OrphanageBasketViewModel(ref));

class OrphanageBasketViewModel {
  Ref ref;

  late final OrphanageBasketService _orphanageBasketService;

  OrphanageBasketState orphanageBasketState = OrphanageBasketState();

  List<OrphanageBasketEntity>? get _entities => orphanageBasketState.value;

  int get total => calculateSumOfElements();

  OrphanageBasketViewModel(this.ref) {
    _orphanageBasketService = ref.read(orphanageBasketServiceProvider);
  }

  void getInfo() => orphanageBasketState
      .withResponse(_orphanageBasketService.getOrphanageBasket());

  int calculateSumOfElements() {
    int sum = 0;
    for (OrphanageBasketEntity entityItem in _entities!) {
      sum += (entityItem.price * entityItem.count);
    }
    return sum;
  }

  void updateBasket(int count, int requestId) {
    orphanageBasketState
        .withResponse(_orphanageBasketService.updateOrphanageBasket(
      entity: UpdateBasketItemEntity(count, requestId),
    ));
  }

  void deleteBasket(int basketProductId) {
    orphanageBasketState
        .withResponse(_orphanageBasketService.deleteOrphanageBasket(
      DonateDeleteDto(basketProductId: basketProductId),
    ));
  }

  void addOrUpdateBasket(int requestId, int count) async {
    bool isNewProduct = true;
    for (OrphanageBasketEntity entityItem in _entities!) {
      if (entityItem.requestId == requestId) {
        updateBasket(count, requestId);
        isNewProduct = false;
        break;
      }
    }
    if (isNewProduct) {
      orphanageBasketState
          .withResponse(_orphanageBasketService.addOrphanageBasket(
        entity: AddBasketItemEntity(requestId: requestId, count: count),
      ));
    }
  }

  void payment(BuildContext context) async {
    final response = await _orphanageBasketService.donate(
      DonateRequestDTO(
        basketProductIds: _entities!.map((e) => e.basketProductId).toList(),
        message: '', // 필요 시 메시지를 추가
      ),
    );

    if (context.mounted) {
      if (response.isSuccess) {
        // 성공: 후원 성공 페이지로 이동
        context.go(OrphanageResultScreen.routeName);
      } else {
        // 실패: SnackBar로 알림 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? "후원에 실패했습니다."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
