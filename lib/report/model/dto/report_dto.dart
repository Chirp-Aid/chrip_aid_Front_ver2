import 'package:json_annotation/json_annotation.dart';

part 'report_dto.g.dart';

@JsonSerializable()
class ReportDTO {
  @JsonKey(name: 'description') // 신고 사유
  final String description;

  @JsonKey(name: 'target_id') // 대상 ID
  final int targetId;

  @JsonKey(name: 'target_name') // 대상 이름
  final String targetName;

  @JsonKey(name: 'target_type') // 대상 유형
  final String targetType;

  @JsonKey(name: 'board_type') // 게시판 유형
  final String boardType;

  @JsonKey(name: 'board_content') // 게시판 내용
  final String boardContent;

  ReportDTO({
    required this.description,
    required this.targetId,
    required this.targetName,
    required this.targetType,
    required this.boardType,
    required this.boardContent,
  });

  // JSON 직렬화 및 역직렬화 메서드
  factory ReportDTO.fromJson(Map<String, dynamic> json) =>
      _$ReportDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDTOToJson(this);
}
