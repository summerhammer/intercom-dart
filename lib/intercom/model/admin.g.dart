// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      id: AdminId.fromJson(json['id']),
      name: json['name'] as String,
      email: json['email'] as String,
      jobTitle: json['job_title'] as String,
      awayModeEnabled: json['away_mode_enabled'] as bool,
      awayModeReassign: json['away_mode_reassign'] as bool,
      hasInboxSeat: json['has_inbox_seat'] as bool,
      teamIds: (json['teamIds'] as List<dynamic>).map((e) => e as int).toList(),
      avatar: json['avatar'] as String,
      teamPriorityLevel: TeamPriorityLevel.fromJson(
          json['team_priority_level'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'job_title': instance.jobTitle,
      'away_mode_enabled': instance.awayModeEnabled,
      'away_mode_reassign': instance.awayModeReassign,
      'has_inbox_seat': instance.hasInboxSeat,
      'teamIds': instance.teamIds,
      'avatar': instance.avatar,
      'team_priority_level': instance.teamPriorityLevel,
    };

TeamPriorityLevel _$TeamPriorityLevelFromJson(Map<String, dynamic> json) =>
    TeamPriorityLevel(
      primaryTeamIds: (json['primaryTeamIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      secondaryTeamIds: (json['secondaryTeamIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$TeamPriorityLevelToJson(TeamPriorityLevel instance) =>
    <String, dynamic>{
      'primaryTeamIds': instance.primaryTeamIds,
      'secondaryTeamIds': instance.secondaryTeamIds,
    };
