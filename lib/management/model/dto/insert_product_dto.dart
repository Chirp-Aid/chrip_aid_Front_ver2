import 'package:json_annotation/json_annotation.dart';

part 'insert_product_dto.g.dart';

@JsonSerializable()
class InsertProductDTO {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "link")
  final String link;

  InsertProductDTO({
    required this.title,
    required this.price,
    required this.image,
    required this.link,
  });


  Map<String, dynamic> toJson() => _$InsertProductDTOToJson(this);

  factory InsertProductDTO.fromJson(Map<String, dynamic> json) =>
      _$InsertProductDTOFromJson(json);
}
