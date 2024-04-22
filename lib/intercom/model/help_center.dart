import 'entity.dart';

class HelpCenterId extends EntityId {
  const HelpCenterId(super.value);

  factory HelpCenterId.fromJson(dynamic json) => HelpCenterId(json.toString());

  @override
  String toJson() => value;
}