// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminReportDto _$AdminReportDtoFromJson(Map<String, dynamic> json) =>
    AdminReportDto(
      reportId: json['reportId'] as String,
      description: json['description'] as String,
      reporterId: json['reporterId'] as String,
      reporterName: json['reporterName'] as String,
      reporterType: json['reporterType'] as String,
      targetId: json['targetId'] as String?,
      targetName: json['targetName'] as String?,
      targetType: json['targetType'] as String?,
      boardId: json['boardId'] as String?,
      boardTitle: json['boardTitle'] as String?,
      boardType: json['boardType'] as String?,
    );

Map<String, dynamic> _$AdminReportDtoToJson(AdminReportDto instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'description': instance.description,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'reporterType': instance.reporterType,
      'targetId': instance.targetId,
      'targetName': instance.targetName,
      'targetType': instance.targetType,
      'boardId': instance.boardId,
      'boardTitle': instance.boardTitle,
      'boardType': instance.boardType,
    };
