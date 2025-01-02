import 'package:json_annotation/json_annotation.dart';
part 'orphanage_basket_entity.g.dart';

@JsonSerializable()
class OrphanageBasketEntity {
  @JsonKey(name: 'request_id')
  final int requestId;
  @JsonKey(name: 'basket_product_id')
  final int basketProductId;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'orphanage_name')
  final String orphanageName;
  @JsonKey(name: 'product_photo')
  final String productPhoto;

  OrphanageBasketEntity({
    required this.requestId,
    required this.basketProductId,
    required this.productName,
    required this.count,
    required this.price,
    required this.orphanageName,
    required this.productPhoto,
  });

  factory OrphanageBasketEntity.fromJson(Map<String, dynamic> json) {
    print(json);
    return _$OrphanageBasketEntityFromJson(json);
  }

}