import 'package:json_annotation/json_annotation.dart';

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
    return 'PaginatedPages{type: $type, next: $next, page: $page, perPage: $perPage, totalPages: $totalPages}';
  }
}

@JsonSerializable()
class PaginatedPagesNext {
  final int page;

  @JsonKey(name: 'starting_after')
  final String? startingAfter;

  PaginatedPagesNext({required this.page, required this.startingAfter});

  factory PaginatedPagesNext.fromJson(Map<String, dynamic> json) => _$PaginatedPagesNextFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedPagesNextToJson(this);

  @override
  String toString() {
    return 'PaginatedPagesNext{page: $page, startingAfter: $startingAfter}';
  }
}