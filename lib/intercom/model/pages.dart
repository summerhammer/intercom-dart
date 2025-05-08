import 'package:json_annotation/json_annotation.dart';

import 'serialization/converters.dart';

part 'pages.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginated<T> {

  final String type;

  final PaginatedPages pages;

  final T data;

  @JsonKey(name: 'total_count')
  final int totalCount;

  Paginated({
    required this.type,
    required this.pages,
    required this.totalCount,
    required this.data,
  });

  factory Paginated.fromJson(Map<String, dynamic> json, T Function(Object? json) decoder) => _$PaginatedFromJson(json, decoder);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T data) encoder) => _$PaginatedToJson(this, encoder);

  @override
  String toString() {
    return 'Paginated{type: $type, pages: $pages, data: $data, totalCount: $totalCount}';
  }
}

@JsonSerializable()
class PaginatedPages {
  final String type = 'pages';

  @PaginatedPagesNextConverter()
  final PaginatedPagesNext? next;

  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  PaginatedPages({
    required this.next,
    required this.page,
    required this.perPage,
    required this.totalPages,
  });

  factory PaginatedPages.fromJson(Map<String, dynamic> json) => _$PaginatedPagesFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedPagesToJson(this);

  @override
  String toString() {
    return 'PaginatedPages{'
      'type: $type, '
      'next: $next, '
      'page: $page, '
      'perPage: $perPage, '
      'totalPages: $totalPages}';
  }
}

sealed class PaginatedPagesNext {
  const PaginatedPagesNext();

  const factory PaginatedPagesNext.link({
    required String url,
  }) = PaginatedPagesLinkNext;

  const factory PaginatedPagesNext.cursor({
    required int page,
    required String? startingAfter,
  }) = PaginatedPagesCursorNext;

  Map<String, String> get query =>
    throw UnsupportedError('Use PaginatedPagesLinkNext or PaginatedPagesCursorNext instead');
}

class PaginatedPagesLinkNext extends PaginatedPagesNext {
  final String url;

  const PaginatedPagesLinkNext({required this.url});

  @override
  Map<String, String> get query => Uri.parse(url).queryParameters;

  @override
  String toString() {
    return 'PaginatedPagesLinkNext{url: $url}';
  }
}

class PaginatedPagesCursorNext extends PaginatedPagesNext {
  final int page;

  @JsonKey(name: 'starting_after')
  final String? startingAfter;

  const PaginatedPagesCursorNext({
    required this.page,
    required this.startingAfter,
  });

  PaginatedPagesCursorNext.fromJson(Map<String, dynamic> json) : this(
    page: json['page'] as int,
    startingAfter: json['starting_after'] as String?,
  );

  @override
  Map<String, String> get query => {
    'starting_after': startingAfter ?? '',
  };

  @override
  String toString() {
    return 'PaginatedPagesNext{page: $page, startingAfter: $startingAfter}';
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'starting_after': startingAfter,
  };
}
