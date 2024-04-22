import 'package:intercom_api/intercom/model/tag.dart';

import 'client.dart';

class Tags {
  final Client client;
  final String path = '/tags';

  const Tags(this.client);

  Future<List<Tag>> list() async {
    return client.get(path, decoder: ListOfTags.fromJson);
  }
}
