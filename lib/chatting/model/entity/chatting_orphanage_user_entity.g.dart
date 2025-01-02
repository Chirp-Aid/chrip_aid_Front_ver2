// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_orphanage_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChattingOrphanageUserEntity _$ChattingOrphanageUserEntityFromJson(
        Map<String, dynamic> json) =>
    ChattingOrphanageUserEntity(
      orphanageUserId: json['orphanageUserId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ChattingOrphanageUserEntityToJson(
        ChattingOrphanageUserEntity instance) =>
    <String, dynamic>{
      'orphanageUserId': instance.orphanageUserId,
      'name': instance.name,
      'email': instance.email,
    };
