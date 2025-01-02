// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_user_edit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageUserEditDto _$OrphanageUserEditDtoFromJson(
        Map<String, dynamic> json) =>
    OrphanageUserEditDto(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$OrphanageUserEditDtoToJson(
        OrphanageUserEditDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
