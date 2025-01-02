// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_user_add_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageUserAddDto _$OrphanageUserAddDtoFromJson(Map<String, dynamic> json) =>
    OrphanageUserAddDto(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      orphanageName: json['orphanage_name'] as String,
    );

Map<String, dynamic> _$OrphanageUserAddDtoToJson(
        OrphanageUserAddDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'orphanage_name': instance.orphanageName,
    };
