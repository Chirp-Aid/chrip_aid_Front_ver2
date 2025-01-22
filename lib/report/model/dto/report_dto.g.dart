// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDto _$ReportDtoFromJson(Map<String, dynamic> json) => ReportDto(
      description: json['description'] as String,
      targetId: json['target_id'] as String,
      targetName: json['target_name'] as String,
      targetType: json['target_type'] as String,
      boardType: json['board_type'] as String,
      boardContent: json['board_content'] as String,
    );

Map<String, dynamic> _$ReportDtoToJson(ReportDto instance) => <String, dynamic>{
      'description': instance.description,
      'target_id': instance.targetId,
      'target_name': instance.targetName,
      'target_type': instance.targetType,
      'board_type': instance.boardType,
      'board_content': instance.boardContent,
    };
