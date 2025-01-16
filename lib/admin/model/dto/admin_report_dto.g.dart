// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminReportDto _$AdminReportDtoFromJson(Map<String, dynamic> json) =>
    AdminReportDto(
      reportId: json['report_id'] as String,
      description: json['description'] as String,
      reporterId: json['reporter_id'] as String,
      reporterName: json['reporter_name'] as String,
      reporterType: json['reporter_type'] as String,
      targetId: json['target_id'] as String?,
      targetName: json['target_name'] as String?,
      targetType: json['target_type'] as String?,
      boardType: json['board_type'] as String?,
      boardContent: json['board_content'] as String?,
    );

Map<String, dynamic> _$AdminReportDtoToJson(AdminReportDto instance) =>
    <String, dynamic>{
      'report_id': instance.reportId,
      'description': instance.description,
      'reporter_id': instance.reporterId,
      'reporter_name': instance.reporterName,
      'reporter_type': instance.reporterType,
      'target_id': instance.targetId,
      'target_name': instance.targetName,
      'target_type': instance.targetType,
      'board_type': instance.boardType,
      'board_content': instance.boardContent,
    };
