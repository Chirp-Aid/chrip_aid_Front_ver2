import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/member/model/entity/orphanage_user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_member_entity.g.dart';

@JsonSerializable()
class UserMemberEntity implements MemberEntity {
  @override
  @JsonKey(name: 'email')
  String email;
  @override
  @JsonKey(name: 'name')
  String name;
  @override
  @JsonKey(name: 'user_id')
  String userId;

  UserMemberEntity({
    required this.email,
    required this.name,
    required this.userId,
  });

  @override
  Map<String, dynamic> toJson() => _$UserMemberEntityToJson(this);

  factory UserMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$UserMemberEntityFromJson(json);

  @override
  // TODO: implement orphanageId
  OrphanageId? get orphanageId => throw UnimplementedError();

  @override
  // TODO: implement orphanageUserId
  String? get orphanageUserId => throw UnimplementedError();
}