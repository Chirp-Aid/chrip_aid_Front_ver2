// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    ChatMessageDto(
      messageId: json['messageId'] as String,
      sender: json['sender'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatMessageDtoToJson(ChatMessageDto instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'sender': instance.sender,
      'type': instance.type,
      'content': instance.content,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
    };
