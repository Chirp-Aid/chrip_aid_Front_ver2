import 'package:json_annotation/json_annotation.dart';

import '../entity/report_entity.dart';

part 'admin_report_dto.g.dart';

@JsonSerializable()
class AdminReportDto {
  @JsonKey(name: 'report_id')
  final String reportId;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'reporter_id')
  final String reporterId;
  @JsonKey(name: 'reporter_name')
  final String reporterName;
  @JsonKey(name: 'reporter_type')
  final String reporterType;
  @JsonKey(name: 'target_id')
  final String? targetId;
  @JsonKey(name: 'target_name')
  final String? targetName;
  @JsonKey(name: 'target_type')
  final String? targetType;
  @JsonKey(name: 'board_type')
  final String? boardType;
  @JsonKey(name: 'board_content')
  final String? boardContent;

  AdminReportDto({
    required this.reportId,
    required this.description,
    required this.reporterId,
    required this.reporterName,
    required this.reporterType,
    this.targetId,
    this.targetName,
    this.targetType,
    this.boardType,
    this.boardContent,
  });

  factory AdminReportDto.fromJson(Map<String, dynamic> json) =>
      _$AdminReportDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdminReportDtoToJson(this);

  // DTO에서 Entity로 변환
  ReportEntity toEntity() {
    return ReportEntity(
reporterId: reporterId,
      description: description,
      reportId: reporterId,
      reporterName: reporterName,
      reporterType: reporterType,
      targetId: targetId,
      targetName: targetName,
      targetType: targetType,
      boardType: boardType,
      boardContent: boardContent,
    );
  }
}
