import 'package:json_annotation/json_annotation.dart';

import '../pages.dart';

DateTime secondsToDateTime(int json) {
  return DateTime.fromMillisecondsSinceEpoch(json * 1000);
}

int dateTimeToSeconds(DateTime value) {
  return value.millisecondsSinceEpoch ~/ 1000;
}

class PaginatedPagesNextConverter implements JsonConverter<PaginatedPagesNext?, dynamic> {
  const PaginatedPagesNextConverter();

  @override
  PaginatedPagesNext? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }

    if (json is String) {
      return PaginatedPagesNext.link(url: json);
    }

    if (json is Map<String, dynamic>) {
      return PaginatedPagesCursorNext.fromJson(json);
    }

    throw FormatException('Unexpected JSON type for PaginatedPagesNext: ${json.runtimeType}');
  }

  @override
  dynamic toJson(PaginatedPagesNext? value) {
    if (value == null) {
      return null;
    }

    return switch (value) {
      PaginatedPagesLinkNext next => next.url,
      PaginatedPagesCursorNext next => next.toJson(),
    };
  }
}