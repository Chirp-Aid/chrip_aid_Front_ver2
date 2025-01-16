import 'package:json_annotation/json_annotation.dart';

part 'report_entity.g.dart';

@JsonSerializable()
class ReportEntity {
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

  // 생성자
  ReportEntity({
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

  // JSON -> 객체 변환 (팩토리 메소드)
  factory ReportEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportEntityFromJson(json);

  // 객체 -> JSON 변환 (메소드)
  Map<String, dynamic> toJson() => _$ReportEntityToJson(this);
}
