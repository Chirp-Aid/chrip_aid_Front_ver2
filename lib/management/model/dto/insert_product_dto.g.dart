// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProductDTO _$InsertProductDTOFromJson(Map<String, dynamic> json) =>
    InsertProductDTO(
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      image: json['image'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$InsertProductDTOToJson(InsertProductDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'link': instance.link,
    };
