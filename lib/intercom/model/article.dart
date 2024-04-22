import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';
import 'serialization/converters.dart';

part 'article.g.dart';

@JsonSerializable()
class ArticleSearch {
  final List<Article> articles;

  final List<Highlight> highlights;

  const ArticleSearch({required this.articles, required this.highlights});

  const ArticleSearch.empty() : articles = const [], highlights = const [];

  factory ArticleSearch.fromJson(Object? json) => json is Map<String, dynamic>
    ? _$ArticleSearchFromJson(json)
    : const ArticleSearch.empty();

  Map<String, dynamic> toJson() => _$ArticleSearchToJson(this);
}

@JsonSerializable()
class Article extends ArticleContent implements Entity {

  @override
  get type => 'article';

  @override
  final ArticleId id;

  @JsonKey(name: 'workspace_id')
  final EntityId workspaceId;

  @JsonKey(name: 'parent_id')
  final EntityId? parentId;

  @JsonKey(name: 'parent_ids')
  final List<EntityId> parentIds;

  final ArticleStatistics? statistics;

  @JsonKey(name: 'default_locale')
  final String? defaultLocale;

  @JsonKey(name: 'translated_content')
  final ArticleTranslatedContent? translations;

  const Article({
    required super.title,
    required super.description,
    required super.body,
    required super.authorId,
    required super.state,
    required super.createdAt,
    required super.updatedAt,
    required super.url,
    required this.id,
    required this.workspaceId,
    required this.parentIds,
    this.parentId,
    this.statistics,
    this.defaultLocale,
    this.translations,
  });

  factory Article.fromJson(json) => _$ArticleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

class ArticleId implements EntityId {
  @override
  final String value;
  const ArticleId(this.value);

  factory ArticleId.fromJson(dynamic json) => ArticleId(json.toString());

  @override
  String toJson() => value;
}

@JsonSerializable()
class ArticleContent {
  final type = 'article_content';

  final String title;

  final String? description;

  final String? body;

  @JsonKey(name: 'author_id')
  final EntityId? authorId;

  final ArticleState? state;

  @JsonKey(name: 'created_at', fromJson: secondsToDateTime, toJson: dateTimeToSeconds)
  final DateTime createdAt;

  @JsonKey(name: 'updated_at', fromJson: secondsToDateTime, toJson: dateTimeToSeconds)
  final DateTime updatedAt;

  final String? url;

  const ArticleContent({
    required this.title,
    required this.description,
    required this.body,
    required this.authorId,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
  });

  factory ArticleContent.fromJson(Map<String, dynamic> json) => _$ArticleContentFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleContentToJson(this);
}

enum ArticleState {
  published,
  draft,
}

@JsonSerializable()
class ArticleStatistics {
  final type = 'article_statistics';

  final int views;

  final int conversions;

  final int reactions;

  @JsonKey(name: 'happy_reaction_percentage')
  final int happyReactionPercentage;

  @JsonKey(name: 'neutral_reaction_percentage')
  final int neutralReactionPercentage;

  @JsonKey(name: 'sad_reaction_percentage')
  final int sadReactionPercentage;

  ArticleStatistics({
    required this.views,
    required this.conversions,
    required this.reactions,
    required this.happyReactionPercentage,
    required this.neutralReactionPercentage,
    required this.sadReactionPercentage,
  });

  factory ArticleStatistics.fromJson(Map<String, dynamic> json) => _$ArticleStatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleStatisticsToJson(this);
}

// ignore_for_file: non_constant_identifier_names
@JsonSerializable()
class ArticleTranslatedContent {
  final type = 'article_translated_content';

  final ArticleContent? ar;
  final ArticleContent? bg;
  final ArticleContent? bs;
  final ArticleContent? ca;
  final ArticleContent? cs;
  final ArticleContent? da;
  final ArticleContent? de;
  final ArticleContent? el;
  final ArticleContent? en;
  final ArticleContent? es;
  final ArticleContent? et;
  final ArticleContent? fi;
  final ArticleContent? fr;
  final ArticleContent? he;
  final ArticleContent? hr;
  final ArticleContent? hu;
  final ArticleContent? id;
  final ArticleContent? it;
  final ArticleContent? ja;
  final ArticleContent? ko;
  final ArticleContent? lt;
  final ArticleContent? lv;
  final ArticleContent? mn;
  final ArticleContent? nb;
  final ArticleContent? nl;
  final ArticleContent? pl;
  final ArticleContent? pt;
  final ArticleContent? ro;
  final ArticleContent? ru;
  final ArticleContent? sl;
  final ArticleContent? sr;
  final ArticleContent? sv;
  final ArticleContent? tr;
  final ArticleContent? vi;

  @JsonKey(name: 'pt-BR')
  final ArticleContent? pt_BR;

  @JsonKey(name: 'zh-CH')
  final ArticleContent? zh_CN;

  @JsonKey(name: 'zh-TW')
  final ArticleContent? zh_TW;

  const ArticleTranslatedContent({
    required this.ar,
    required this.bg,
    required this.bs,
    required this.ca,
    required this.cs,
    required this.da,
    required this.de,
    required this.el,
    required this.en,
    required this.es,
    required this.et,
    required this.fi,
    required this.fr,
    required this.he,
    required this.hr,
    required this.hu,
    required this.id,
    required this.it,
    required this.ja,
    required this.ko,
    required this.lt,
    required this.lv,
    required this.mn,
    required this.nb,
    required this.nl,
    required this.pl,
    required this.pt,
    required this.ro,
    required this.ru,
    required this.sl,
    required this.sr,
    required this.sv,
    required this.tr,
    required this.vi,
    required this.pt_BR,
    required this.zh_CN,
    required this.zh_TW,
  });

  factory ArticleTranslatedContent.fromJson(Map<String, dynamic> json) => _$ArticleTranslatedContentFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleTranslatedContentToJson(this);
}

@JsonSerializable()
class Highlight {
  @JsonKey(name: 'article_id')
  final ArticleId articleId;

  @JsonKey(name: 'highlighted_title')
  final List<HighlightText> highlightedTitle;

  @JsonKey(name: 'highlighted_summary')
  final List<HighlightText> highlightedSummary;

  const Highlight({
    required this.articleId,
    required this.highlightedTitle,
    required this.highlightedSummary,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) => _$HighlightFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightToJson(this);

}

@JsonSerializable()
class HighlightText {
  final HighlightTextType type;

  final String text;

  const HighlightText({required this.type, required this.text});

  factory HighlightText.fromJson(Map<String, dynamic> json) => _$HighlightTextFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightTextToJson(this);
}

enum HighlightTextType {
  highlight,
  plain
}

extension ListOfArticles on List<Article> {
  Iterable<Map<String, dynamic>> toJson() => map((tag) => tag.toJson());

  static List<Article> fromJson(List<dynamic> json) {
    return json.map((tag) => Article.fromJson(tag)).toList();
  }

}