// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageUserEntity _$OrphanageUserEntityFromJson(Map<String, dynamic> json) =>
    OrphanageUserEntity(
      orphanageUserId: json['orphanage_user_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      orphanageId:
          OrphanageId.fromJson(json['orphanage_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrphanageUserEntityToJson(
        OrphanageUserEntity instance) =>
    <String, dynamic>{
      'orphanage_user_id': instance.orphanageUserId,
      'name': instance.name,
      'email': instance.email,
      'orphanage_id': instance.orphanageId,
    };

OrphanageId _$OrphanageIdFromJson(Map<String, dynamic> json) => OrphanageId(
      orphanageId: (json['orphanage_id'] as num).toInt(),
    );

Map<String, dynamic> _$OrphanageIdToJson(OrphanageId instance) =>
    <String, dynamic>{
      'orphanage_id': instance.orphanageId,
    };
