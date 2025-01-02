// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailEntity _$UserDetailEntityFromJson(Map<String, dynamic> json) =>
    UserDetailEntity(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: (json['age'] as num).toInt(),
      sex: UserDetailEntity._sexFromJson(json['sex'] as String),
      nickname: json['nickname'] as String,
      region: UserDetailEntity._regionFromJson(json['region'] as String),
      phoneNumber: json['phone_number'] as String,
      profilePhoto: json['profile_photo'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserDetailEntityToJson(UserDetailEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'sex': UserDetailEntity._sexToJson(instance.sex),
      'nickname': instance.nickname,
      'region': UserDetailEntity._regionToJson(instance.region),
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
      'role': instance.role,
    };
