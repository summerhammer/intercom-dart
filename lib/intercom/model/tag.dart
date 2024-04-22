import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag implements Entity {
  @override
  final TagId id;
  @override
  final String type = "tag";

  final String name;

  const Tag({required this.id, required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

}

class TagId extends EntityId {
  const TagId(super.value);

  factory TagId.fromJson(dynamic json) => TagId(json.toString());
}

extension ListOfTags on List<Tag> {
  Iterable<Map<String, dynamic>> toJson() => map((tag) => tag.toJson());

  static List<Tag> fromJson(json) => json.map((tag) => Tag.fromJson(tag)).toList();
}