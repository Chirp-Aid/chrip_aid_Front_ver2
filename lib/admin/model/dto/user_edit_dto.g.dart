// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_edit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEditDto _$UserEditDtoFromJson(Map<String, dynamic> json) => UserEditDto(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String,
      phoneNumber: json['phone_number'] as String,
      profilePhoto: json['profile_photo'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserEditDtoToJson(UserEditDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'sex': instance.sex,
      'nickname': instance.nickname,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
      'role': instance.role,
    };
