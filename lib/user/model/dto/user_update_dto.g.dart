// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateDto _$UserUpdateDtoFromJson(Map<String, dynamic> json) =>
    UserUpdateDto(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String,
      phoneNumber: json['phone_number'] as String,
      profilePhoto: json['profile_photo'] as String,
    );

Map<String, dynamic> _$UserUpdateDtoToJson(UserUpdateDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
      'nickname': instance.nickname,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
    };
