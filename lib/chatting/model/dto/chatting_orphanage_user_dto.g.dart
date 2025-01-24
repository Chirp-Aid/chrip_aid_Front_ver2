// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_orphanage_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChattingOrphanageUserDto _$ChattingOrphanageUserDtoFromJson(
        Map<String, dynamic> json) =>
    ChattingOrphanageUserDto(
      orphanageUserId: json['orphanage_user_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      orphanageName: json['orphanage_name'] as String,
    );

Map<String, dynamic> _$ChattingOrphanageUserDtoToJson(
        ChattingOrphanageUserDto instance) =>
    <String, dynamic>{
      'orphanage_user_id': instance.orphanageUserId,
      'name': instance.name,
      'email': instance.email,
      'orphanage_name': instance.orphanageName,
    };
