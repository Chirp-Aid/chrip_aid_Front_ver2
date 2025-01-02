// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_request_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitRequestPostDto _$VisitRequestPostDtoFromJson(Map<String, dynamic> json) =>
    VisitRequestPostDto(
      reservationId: (json['reservationId'] as num).toInt(),
      writeDate: json['writeDate'] as String,
      visitDate: json['visitDate'] as String,
      reason: json['reason'] as String,
      state: json['state'] as String,
      rejectReason: json['rejectReason'] as String?,
    );

Map<String, dynamic> _$VisitRequestPostDtoToJson(
        VisitRequestPostDto instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'writeDate': instance.writeDate,
      'visitDate': instance.visitDate,
      'reason': instance.reason,
      'state': instance.state,
      'rejectReason': instance.rejectReason,
    };
