// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomDto _$ChatRoomDtoFromJson(Map<String, dynamic> json) => ChatRoomDto(
      chatRoomId: json['chat_room_id'] as String,
      user: ChattingUserDto.fromJson(json['user'] as Map<String, dynamic>),
      orphanageUser: ChattingOrphanageUserDto.fromJson(
          json['orphanage_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRoomDtoToJson(ChatRoomDto instance) =>
    <String, dynamic>{
      'chat_room_id': instance.chatRoomId,
      'user': instance.user,
      'orphanage_user': instance.orphanageUser,
    };
