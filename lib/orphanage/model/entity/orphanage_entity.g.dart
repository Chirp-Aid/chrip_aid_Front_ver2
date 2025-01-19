// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageEntity _$OrphanageEntityFromJson(Map<String, dynamic> json) =>
    OrphanageEntity(
      orphanageUserId: json['orphanage_user_id'] as String,
      orphanageId: (json['orphanage_id'] as num).toInt(),
      orphanageName: json['orphanage_name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      photo: json['photo'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrphanageEntityToJson(OrphanageEntity instance) =>
    <String, dynamic>{
      'orphanage_user_id': instance.orphanageUserId,
      'orphanage_id': instance.orphanageId,
      'orphanage_name': instance.orphanageName,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'photo': instance.photo,
      'name': instance.name,
    };
