// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleSearch _$ArticleSearchFromJson(Map<String, dynamic> json) =>
    ArticleSearch(
      articles:
          (json['articles'] as List<dynamic>).map(Article.fromJson).toList(),
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleSearchToJson(ArticleSearch instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'highlights': instance.highlights,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      description: json['description'] as String?,
      body: json['body'] as String?,
      authorId: json['author_id'] == null
          ? null
          : EntityId.fromJson(json['author_id']),
      state: $enumDecodeNullable(_$ArticleStateEnumMap, json['state']),
      createdAt: secondsToDateTime(json['created_at'] as int),
      updatedAt: secondsToDateTime(json['updated_at'] as int),
      url: json['url'] as String?,
      id: ArticleId.fromJson(json['id']),
      workspaceId: EntityId.fromJson(json['workspace_id']),
      parentIds:
          (json['parent_ids'] as List<dynamic>).map(EntityId.fromJson).toList(),
      parentId: json['parent_id'] == null
          ? null
          : EntityId.fromJson(json['parent_id']),
      statistics: json['statistics'] == null
          ? null
          : ArticleStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>),
      defaultLocale: json['default_locale'] as String?,
      translations: json['translated_content'] == null
          ? null
          : ArticleTranslatedContent.fromJson(
              json['translated_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'author_id': instance.authorId,
      'state': _$ArticleStateEnumMap[instance.state],
      'created_at': dateTimeToSeconds(instance.createdAt),
      'updated_at': dateTimeToSeconds(instance.updatedAt),
      'url': instance.url,
      'id': instance.id,
      'workspace_id': instance.workspaceId,
      'parent_id': instance.parentId,
      'parent_ids': instance.parentIds,
      'statistics': instance.statistics,
      'default_locale': instance.defaultLocale,
      'translated_content': instance.translations,
    };

const _$ArticleStateEnumMap = {
  ArticleState.published: 'published',
  ArticleState.draft: 'draft',
};

ArticleContent _$ArticleContentFromJson(Map<String, dynamic> json) =>
    ArticleContent(
      title: json['title'] as String,
      description: json['description'] as String?,
      body: json['body'] as String?,
      authorId: json['author_id'] == null
          ? null
          : EntityId.fromJson(json['author_id']),
      state: $enumDecodeNullable(_$ArticleStateEnumMap, json['state']),
      createdAt: secondsToDateTime(json['created_at'] as int),
      updatedAt: secondsToDateTime(json['updated_at'] as int),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArticleContentToJson(ArticleContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'author_id': instance.authorId,
      'state': _$ArticleStateEnumMap[instance.state],
      'created_at': dateTimeToSeconds(instance.createdAt),
      'updated_at': dateTimeToSeconds(instance.updatedAt),
      'url': instance.url,
    };

ArticleStatistics _$ArticleStatisticsFromJson(Map<String, dynamic> json) =>
    ArticleStatistics(
      views: json['views'] as int,
      conversions: json['conversions'] as int,
      reactions: json['reactions'] as int,
      happyReactionPercentage: json['happy_reaction_percentage'] as int,
      neutralReactionPercentage: json['neutral_reaction_percentage'] as int,
      sadReactionPercentage: json['sad_reaction_percentage'] as int,
    );

Map<String, dynamic> _$ArticleStatisticsToJson(ArticleStatistics instance) =>
    <String, dynamic>{
      'views': instance.views,
      'conversions': instance.conversions,
      'reactions': instance.reactions,
      'happy_reaction_percentage': instance.happyReactionPercentage,
      'neutral_reaction_percentage': instance.neutralReactionPercentage,
      'sad_reaction_percentage': instance.sadReactionPercentage,
    };

ArticleTranslatedContent _$ArticleTranslatedContentFromJson(
        Map<String, dynamic> json) =>
    ArticleTranslatedContent(
      ar: json['ar'] == null
          ? null
          : ArticleContent.fromJson(json['ar'] as Map<String, dynamic>),
      bg: json['bg'] == null
          ? null
          : ArticleContent.fromJson(json['bg'] as Map<String, dynamic>),
      bs: json['bs'] == null
          ? null
          : ArticleContent.fromJson(json['bs'] as Map<String, dynamic>),
      ca: json['ca'] == null
          ? null
          : ArticleContent.fromJson(json['ca'] as Map<String, dynamic>),
      cs: json['cs'] == null
          ? null
          : ArticleContent.fromJson(json['cs'] as Map<String, dynamic>),
      da: json['da'] == null
          ? null
          : ArticleContent.fromJson(json['da'] as Map<String, dynamic>),
      de: json['de'] == null
          ? null
          : ArticleContent.fromJson(json['de'] as Map<String, dynamic>),
      el: json['el'] == null
          ? null
          : ArticleContent.fromJson(json['el'] as Map<String, dynamic>),
      en: json['en'] == null
          ? null
          : ArticleContent.fromJson(json['en'] as Map<String, dynamic>),
      es: json['es'] == null
          ? null
          : ArticleContent.fromJson(json['es'] as Map<String, dynamic>),
      et: json['et'] == null
          ? null
          : ArticleContent.fromJson(json['et'] as Map<String, dynamic>),
      fi: json['fi'] == null
          ? null
          : ArticleContent.fromJson(json['fi'] as Map<String, dynamic>),
      fr: json['fr'] == null
          ? null
          : ArticleContent.fromJson(json['fr'] as Map<String, dynamic>),
      he: json['he'] == null
          ? null
          : ArticleContent.fromJson(json['he'] as Map<String, dynamic>),
      hr: json['hr'] == null
          ? null
          : ArticleContent.fromJson(json['hr'] as Map<String, dynamic>),
      hu: json['hu'] == null
          ? null
          : ArticleContent.fromJson(json['hu'] as Map<String, dynamic>),
      id: json['id'] == null
          ? null
          : ArticleContent.fromJson(json['id'] as Map<String, dynamic>),
      it: json['it'] == null
          ? null
          : ArticleContent.fromJson(json['it'] as Map<String, dynamic>),
      ja: json['ja'] == null
          ? null
          : ArticleContent.fromJson(json['ja'] as Map<String, dynamic>),
      ko: json['ko'] == null
          ? null
          : ArticleContent.fromJson(json['ko'] as Map<String, dynamic>),
      lt: json['lt'] == null
          ? null
          : ArticleContent.fromJson(json['lt'] as Map<String, dynamic>),
      lv: json['lv'] == null
          ? null
          : ArticleContent.fromJson(json['lv'] as Map<String, dynamic>),
      mn: json['mn'] == null
          ? null
          : ArticleContent.fromJson(json['mn'] as Map<String, dynamic>),
      nb: json['nb'] == null
          ? null
          : ArticleContent.fromJson(json['nb'] as Map<String, dynamic>),
      nl: json['nl'] == null
          ? null
          : ArticleContent.fromJson(json['nl'] as Map<String, dynamic>),
      pl: json['pl'] == null
          ? null
          : ArticleContent.fromJson(json['pl'] as Map<String, dynamic>),
      pt: json['pt'] == null
          ? null
          : ArticleContent.fromJson(json['pt'] as Map<String, dynamic>),
      ro: json['ro'] == null
          ? null
          : ArticleContent.fromJson(json['ro'] as Map<String, dynamic>),
      ru: json['ru'] == null
          ? null
          : ArticleContent.fromJson(json['ru'] as Map<String, dynamic>),
      sl: json['sl'] == null
          ? null
          : ArticleContent.fromJson(json['sl'] as Map<String, dynamic>),
      sr: json['sr'] == null
          ? null
          : ArticleContent.fromJson(json['sr'] as Map<String, dynamic>),
      sv: json['sv'] == null
          ? null
          : ArticleContent.fromJson(json['sv'] as Map<String, dynamic>),
      tr: json['tr'] == null
          ? null
          : ArticleContent.fromJson(json['tr'] as Map<String, dynamic>),
      vi: json['vi'] == null
          ? null
          : ArticleContent.fromJson(json['vi'] as Map<String, dynamic>),
      pt_BR: json['pt-BR'] == null
          ? null
          : ArticleContent.fromJson(json['pt-BR'] as Map<String, dynamic>),
      zh_CN: json['zh-CH'] == null
          ? null
          : ArticleContent.fromJson(json['zh-CH'] as Map<String, dynamic>),
      zh_TW: json['zh-TW'] == null
          ? null
          : ArticleContent.fromJson(json['zh-TW'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleTranslatedContentToJson(
        ArticleTranslatedContent instance) =>
    <String, dynamic>{
      'ar': instance.ar,
      'bg': instance.bg,
      'bs': instance.bs,
      'ca': instance.ca,
      'cs': instance.cs,
      'da': instance.da,
      'de': instance.de,
      'el': instance.el,
      'en': instance.en,
      'es': instance.es,
      'et': instance.et,
      'fi': instance.fi,
      'fr': instance.fr,
      'he': instance.he,
      'hr': instance.hr,
      'hu': instance.hu,
      'id': instance.id,
      'it': instance.it,
      'ja': instance.ja,
      'ko': instance.ko,
      'lt': instance.lt,
      'lv': instance.lv,
      'mn': instance.mn,
      'nb': instance.nb,
      'nl': instance.nl,
      'pl': instance.pl,
      'pt': instance.pt,
      'ro': instance.ro,
      'ru': instance.ru,
      'sl': instance.sl,
      'sr': instance.sr,
      'sv': instance.sv,
      'tr': instance.tr,
      'vi': instance.vi,
      'pt-BR': instance.pt_BR,
      'zh-CH': instance.zh_CN,
      'zh-TW': instance.zh_TW,
    };

Highlight _$HighlightFromJson(Map<String, dynamic> json) => Highlight(
      articleId: ArticleId.fromJson(json['article_id']),
      highlightedTitle: (json['highlighted_title'] as List<dynamic>)
          .map((e) => HighlightText.fromJson(e as Map<String, dynamic>))
          .toList(),
      highlightedSummary: (json['highlighted_summary'] as List<dynamic>)
          .map((e) => HighlightText.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighlightToJson(Highlight instance) => <String, dynamic>{
      'article_id': instance.articleId,
      'highlighted_title': instance.highlightedTitle,
      'highlighted_summary': instance.highlightedSummary,
    };

HighlightText _$HighlightTextFromJson(Map<String, dynamic> json) =>
    HighlightText(
      type: $enumDecode(_$HighlightTextTypeEnumMap, json['type']),
      text: json['text'] as String,
    );

Map<String, dynamic> _$HighlightTextToJson(HighlightText instance) =>
    <String, dynamic>{
      'type': _$HighlightTextTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

const _$HighlightTextTypeEnumMap = {
  HighlightTextType.highlight: 'highlight',
  HighlightTextType.plain: 'plain',
};
