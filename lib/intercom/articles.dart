import 'package:intercom_api/intercom/model/help_center.dart';
import 'package:intercom_api/intercom/model/pages.dart';

import 'client.dart';
import 'model/article.dart';

class Articles {
  final Client client;
  final String path = '/articles';

  const Articles(this.client);

  Future<Paginated<List<Article>>> list({
    PaginatedPagesNext? page
  }) async {
    return client.get(path,
      query: {
        if (page != null) ...{
          'starting_after': page.startingAfter
        }
      },
      decoder: (json) => Paginated<List<Article>>.fromJson(json, (json) => ListOfArticles.fromJson(json as List))
    );
  }

  Future<Paginated<ArticleSearch>> search({
    String? phrase,
    ArticleState? state,
    HelpCenterId? helpCenterId,
    bool? highlight
  }) async {
    return client.get('$path/search',
      query: {
        'phrase': phrase,
        'state': state?.name,
        'help_center_id': helpCenterId,
        'highlight': highlight,
      },
      decoder: (json) => Paginated<ArticleSearch>.fromJson(json, (json) => ArticleSearch.fromJson(json))
    );
  }

  Future<Article> get(ArticleId id) async {
    return client.get('$path/$id', decoder: Article.fromJson);
  }

  Future<bool> delete(ArticleId id) async {
    return client.delete('$path/$id');
  }

  Future<Article> create(Article article) async {
    return client.post(path, query: article.toJson(), decoder: Article.fromJson);
  }

}
