import 'dart:convert';

import 'package:http/http.dart' as http;

import '../intercom_transport.dart';

class HTTPIntercomTransport extends IntercomTransport {
  const HTTPIntercomTransport({
    required super.auth,
    required super.baseURL
  });

  @override
  Future<T> get<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('GET', path, query: query, decoder: decoder);
  }

  @override
  Future<T> delete<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('DELETE', path, query: query, decoder: decoder);
  }

  @override
  Future<T> post<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('POST', path, query: query, decoder: decoder);
  }

  @override
  Future<T> put<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('PUT', path, query: query, decoder: decoder);
  }

  @override
  Future<T> patch<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('PATCH', path, query: query, decoder: decoder);
  }

  @override
  Future<T> head<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('HEAD', path, query: query, decoder: decoder);
  }

  @override
  Future<T> options<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return _request('OPTIONS', path, query: query, decoder: decoder);
  }

  Future<T> _request<T>(String method, String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    final url = Uri.https(baseURL, path, query);
    late http.Response res;

    switch (method) {
      case 'GET':
        res = await http.get(url, headers: _getHeaders(decoder));
        break;
      case 'DELETE':
        res = await http.delete(url, headers: _getHeaders(decoder));
        break;
      case 'POST':
        res = await http.post(url, headers: _getHeaders(decoder));
        break;
      case 'PUT':
        res = await http.put(url, headers: _getHeaders(decoder));
        break;
      case 'PATCH':
        res = await http.patch(url, headers: _getHeaders(decoder));
        break;
      case 'HEAD':
        res = await http.head(url, headers: _getHeaders(decoder));
        break;
      default:
        throw ArgumentError('Invalid HTTP method $method');
    }

    if (decoder != null) {
      return decoder(jsonDecode(res.body));
    } else if (T == String) {
      return res.body as T;
    }
    throw ArgumentError('decoder must be provided for type $T');
  }

  Map<String, String> _getHeaders<T>(T Function(String)? decoder) {
    return {
      'Accept': decoder != null
          ? 'application/json'
          : T == String
          ? 'text/plain'
          : '*/*',
      'Authorization': auth.header,
      'Intercom-Version': '2.10'
    };
  }

}