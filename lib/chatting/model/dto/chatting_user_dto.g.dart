// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChattingUserDto _$ChattingUserDtoFromJson(Map<String, dynamic> json) =>
    ChattingUserDto(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String,
      phoneNumber: json['phone_number'] as String,
      profilePhoto: json['profile_photo'] as String,
    );

Map<String, dynamic> _$ChattingUserDtoToJson(ChattingUserDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'sex': instance.sex,
      'nickname': instance.nickname,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
    };
