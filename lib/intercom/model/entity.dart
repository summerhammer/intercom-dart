import 'package:json_annotation/json_annotation.dart';

abstract class Entity {
  String get type;
  EntityId get id;
}

@JsonSerializable()
class EntityId {
  final String value;

  const EntityId(this.value);

  @override
  toString() => value;

  EntityId.fromJson(dynamic json) : value = json.toString();

  String toJson() => value;
}
