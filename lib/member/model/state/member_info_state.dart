import 'package:chrip_aid/common/value_state/state/value_state.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';

class MemberInfoState extends ValueStateNotifier<MemberEntity> {
  static MemberInfoState? _instance;

  MemberInfoState._();

  factory MemberInfoState() => _instance ??= MemberInfoState._();
}
