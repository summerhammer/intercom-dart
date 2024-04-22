import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin implements Entity {
  @override
  final String type = 'admin';
  @override
  final AdminId id;
  final String name;
  final String email;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @JsonKey(name: 'away_mode_enabled')
  final bool awayModeEnabled;
  @JsonKey(name: 'away_mode_reassign')
  final bool awayModeReassign;
  @JsonKey(name: 'has_inbox_seat')
  final bool hasInboxSeat;
  final List<int> teamIds;
  final String avatar;
  @JsonKey(name: 'team_priority_level')
  final TeamPriorityLevel teamPriorityLevel;

  Admin({
    required this.id,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.awayModeEnabled,
    required this.awayModeReassign,
    required this.hasInboxSeat,
    required this.teamIds,
    required this.avatar,
    required this.teamPriorityLevel,
  });

  factory Admin.fromJson(json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);
}

class AdminId implements EntityId {
  @override
  final String value;
  const AdminId(this.value);

  factory AdminId.fromJson(dynamic json) => AdminId(json.toString());

  @override
  String toJson() => value;
}

@JsonSerializable()
class TeamPriorityLevel {
  final List<int> primaryTeamIds;
  final List<int> secondaryTeamIds;

  TeamPriorityLevel({
    required this.primaryTeamIds,
    required this.secondaryTeamIds,
  });

  factory TeamPriorityLevel.fromJson(Map<String, dynamic> json) => _$TeamPriorityLevelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamPriorityLevelToJson(this);
}