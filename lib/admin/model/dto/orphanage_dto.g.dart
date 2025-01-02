// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageDto _$OrphanageDtoFromJson(Map<String, dynamic> json) => OrphanageDto(
      orphanageId: (json['orphanage_id'] as num).toInt(),
      orphanageName: json['orphanage_name'] as String,
      adress: json['address'] as String,
      homepageLink: json['homepage_link'] as String,
      phoneNumber: json['phone_number'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$OrphanageDtoToJson(OrphanageDto instance) =>
    <String, dynamic>{
      'orphanage_id': instance.orphanageId,
      'orphanage_name': instance.orphanageName,
      'address': instance.adress,
      'homepage_link': instance.homepageLink,
      'phone_number': instance.phoneNumber,
      'description': instance.description,
      'photo': instance.photo,
    };
