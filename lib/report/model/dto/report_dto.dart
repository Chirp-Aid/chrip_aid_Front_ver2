import 'package:json_annotation/json_annotation.dart';

part 'report_dto.g.dart';

@JsonSerializable()
class ReportDto {
  String description;
  @JsonKey(name: 'target_id')
  String targetId;
  @JsonKey(name: 'target_name')
  String targetName;
  @JsonKey(name: 'target_type')
  String targetType;
  @JsonKey(name: 'board_type')
  String boardType;
  @JsonKey(name: 'board_content')
  String boardContent;

  ReportDto({
    required this.description,
    required this.targetId,
    required this.targetName,
    required this.targetType,
    required this.boardType,
    required this.boardContent,
  });

  Map<String, dynamic> toJson() => _$ReportDtoToJson(this);

  factory ReportDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDtoFromJson(json);
}
