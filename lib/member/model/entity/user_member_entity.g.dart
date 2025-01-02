// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_member_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMemberEntity _$UserMemberEntityFromJson(Map<String, dynamic> json) =>
    UserMemberEntity(
      email: json['email'] as String,
      name: json['name'] as String,
      userId: (json['orphanage_id'] as num).toInt(),
      orphanageId: json['orphanageId'] == null
          ? null
          : OrphanageId.fromJson(json['orphanageId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserMemberEntityToJson(UserMemberEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'orphanage_id': instance.userId,
      'orphanageId': instance.orphanageId,
    };
