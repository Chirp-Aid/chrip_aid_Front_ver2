// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_request_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemRequestPostDto _$ItemRequestPostDtoFromJson(Map<String, dynamic> json) =>
    ItemRequestPostDto(
      requestId: (json['request_id'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      supportedCount: (json['supported_count'] as num).toInt(),
      state: json['state'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ItemRequestPostDtoToJson(ItemRequestPostDto instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'count': instance.count,
      'supported_count': instance.supportedCount,
      'state': instance.state,
      'message': instance.message,
    };
