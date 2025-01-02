// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_thanks_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostThanksEntity _$PostThanksEntityFromJson(Map<String, dynamic> json) =>
    PostThanksEntity(
      reviewId: (json['review_id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      date: json['date'] as String,
      name: json['name'] as String,
      orphanageName: json['orphanage_name'] as String,
      productNames: (json['product_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostThanksEntityToJson(PostThanksEntity instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'title': instance.title,
      'content': instance.content,
      'photos': instance.photos,
      'date': instance.date,
      'name': instance.name,
      'orphanage_name': instance.orphanageName,
      'product_names': instance.productNames,
    };
