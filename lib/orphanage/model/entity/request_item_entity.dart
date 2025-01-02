import 'package:json_annotation/json_annotation.dart';
part 'request_item_entity.g.dart';

@JsonSerializable()
class RequestItemEntity {
  @JsonKey(name: 'request_id')
  final int requestId;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'count')
  final int requestCount;
  @JsonKey(name: 'supported_count')
  final int supportCount;
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'product_photo')
  final String productPhoto;

  RequestItemEntity({
    required this.requestId,
    required this.productName,
    required this.price,
    required this.requestCount,
    required this.supportCount,
    required this.state,
    required this.message,
    required this.productPhoto,
  });

  factory RequestItemEntity.fromJson(Map<String, dynamic> json) =>
      _$RequestItemEntityFromJson(json);
}
