import 'package:chrip_aid/auth/model/type/region.dart';

import 'sub_region.dart';

enum Daegu implements SubRegion {
  junggu('중구'),
  donggu('동구'),
  seogu('서구'),
  namgu('남구'),
  bukgu('북구'),
  suseonggu('수성구'),
  dalseogu('달서구'),
  dalseonggun('달성군'),
  gunwgun('군위군');

  @override
  final String name;

  @override
  MajorRegion get majorRegion => MajorRegion.daegu;

  const Daegu(this.name);

  @override
  String toJson() => "${majorRegion.name} ($name)";

  @override
  String toString() => name;
}
