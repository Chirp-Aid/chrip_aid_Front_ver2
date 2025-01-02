// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      name: json['name'] as String,
      email: json['email'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String,
      phoneNumber: json['phone_number'] as String,
      profilePhoto: json['profile_photo'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'sex': instance.sex,
      'nickname': instance.nickname,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
      'role': instance.role,
    };
