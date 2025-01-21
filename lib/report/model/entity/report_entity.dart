import 'package:json_annotation/json_annotation.dart';

part 'report_entity.g.dart';

@JsonSerializable()
class ReportEntity {
  final String description;
  final String targetId;
  final String targetName;
  final String targetType;
  final String boardType;
  final String boardContent;

  ReportEntity({
    required this.description,
    required this.targetId,
    required this.targetName,
    required this.targetType,
    required this.boardType,
    required this.boardContent,
  });

  // JSON 직렬화 및 역직렬화 메서드
  factory ReportEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReportEntityToJson(this);
}
