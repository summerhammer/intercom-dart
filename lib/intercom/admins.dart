import 'client.dart';
import 'model/admin.dart';

class Admins {
  final Client client;
  final String path = '/admins';

  const Admins(this.client);

  Future<Admin> me() async {
    return client.get('/me', decoder: Admin.fromJson);
  }

  Future<Admin> get(AdminId id) async {
    return client.get('$path/$id', decoder: Admin.fromJson);
  }

  Future<Admin> setAwayMode(AdminId id, {
    required bool enabled,
    required bool reassign,
  }) async {
    return client.post('$path/$id', query: {
      'away_mode_enabled': enabled,
      'away_mode_reassign': reassign,
    }, decoder: Admin.fromJson);
  }

  Future<List<Admin>> list() async {
    return client.get(path, decoder: (json) => List<Admin>.from(json.map((e) => Admin.fromJson(e))));
  }
}