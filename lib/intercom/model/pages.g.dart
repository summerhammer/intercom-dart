// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginated<T> _$PaginatedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paginated<T>(
      type: json['type'] as String,
      pages: PaginatedPages.fromJson(json['pages'] as Map<String, dynamic>),
      totalCount: json['total_count'] as int,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$PaginatedToJson<T>(
  Paginated<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': instance.type,
      'pages': instance.pages,
      'data': toJsonT(instance.data),
      'total_count': instance.totalCount,
    };

PaginatedPages _$PaginatedPagesFromJson(Map<String, dynamic> json) =>
    PaginatedPages(
      next: const PaginatedPagesNextConverter().fromJson(json['next']),
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$PaginatedPagesToJson(PaginatedPages instance) =>
    <String, dynamic>{
      'next': const PaginatedPagesNextConverter().toJson(instance.next),
      'page': instance.page,
      'per_page': instance.perPage,
      'total_pages': instance.totalPages,
    };
