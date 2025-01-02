// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChattingUserEntity _$ChattingUserEntityFromJson(Map<String, dynamic> json) =>
    ChattingUserEntity(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePhoto: json['profilePhoto'] as String,
    );

Map<String, dynamic> _$ChattingUserEntityToJson(ChattingUserEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'sex': instance.sex,
      'nickname': instance.nickname,
      'region': instance.region,
      'phoneNumber': instance.phoneNumber,
      'profilePhoto': instance.profilePhoto,
    };
