// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomEntity _$ChatRoomEntityFromJson(Map<String, dynamic> json) =>
    ChatRoomEntity(
      chatRoomId: json['chatRoomId'] as String,
      user: ChattingUserEntity.fromJson(json['user'] as Map<String, dynamic>),
      orphanageUser: ChattingOrphanageUserEntity.fromJson(
          json['orphanageUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRoomEntityToJson(ChatRoomEntity instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'user': instance.user,
      'orphanageUser': instance.orphanageUser,
    };
