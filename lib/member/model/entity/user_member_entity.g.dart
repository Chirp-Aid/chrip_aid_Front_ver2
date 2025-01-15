// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_member_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMemberEntity _$UserMemberEntityFromJson(Map<String, dynamic> json) =>
    UserMemberEntity(
      email: json['email'] as String,
      name: json['name'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$UserMemberEntityToJson(UserMemberEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'user_id': instance.userId,
    };
