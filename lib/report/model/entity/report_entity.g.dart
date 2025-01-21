// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportEntity _$ReportEntityFromJson(Map<String, dynamic> json) => ReportEntity(
      description: json['description'] as String,
      targetId: json['targetId'] as String,
      targetName: json['targetName'] as String,
      targetType: json['targetType'] as String,
      boardType: json['boardType'] as String,
      boardContent: json['boardContent'] as String,
    );

Map<String, dynamic> _$ReportEntityToJson(ReportEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'targetId': instance.targetId,
      'targetName': instance.targetName,
      'targetType': instance.targetType,
      'boardType': instance.boardType,
      'boardContent': instance.boardContent,
    };
