import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intercom_api/intercom/transport/intercom_transport_logger.dart';

import '../intercom_transport.dart';

class HTTPIntercomTransport extends IntercomTransport {
  final IntercomTransportLogger? logger;

  const HTTPIntercomTransport({
    required super.auth,
    required super.baseURL,
    this.logger,
  });

  @override
  Future<T> get<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('GET', path, query: query, decoder: decoder);
  }

  @override
  Future<T> delete<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('DELETE', path, query: query, decoder: decoder);
  }

  @override
  Future<T> post<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('POST', path, query: query, decoder: decoder);
  }

  @override
  Future<T> put<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('PUT', path, query: query, decoder: decoder);
  }

  @override
  Future<T> patch<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('PATCH', path, query: query, decoder: decoder);
  }

  @override
  Future<T> head<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('HEAD', path, query: query, decoder: decoder);
  }

  @override
  Future<T> options<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return request('OPTIONS', path, query: query, decoder: decoder);
  }

  @protected
  Future<T> request<T>(String method, String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    final url = Uri.https(baseURL, path, query);

    logger?.onRequest(method, url.toString(),
      query: query,
      body: null,
      headers: _getHeaders(decoder),
    );

    late final http.Response res;

    try {
      res = await _request(method, url, headers: _getHeaders(decoder));
    } catch (e) {
      logger?.onError(method, url.toString(), error: e);
      rethrow;
    }

    logger?.onResponse(method, url.toString(),
      statusCode: res.statusCode,
      body: res.body,
      headers: res.headers,
    );

    if (decoder != null) {
      return decoder(jsonDecode(res.body));
    } else if (T == String) {
      return res.body as T;
    }
    throw ArgumentError('decoder must be provided for type $T');
  }

  @protected
  Future<http.Response> _request(String method, Uri url, {
    Map<String, String>? headers
  }) async {

    switch (method) {
      case 'GET':
        return await http.get(url, headers: headers);
      case 'DELETE':
        return await http.delete(url, headers: headers);
      case 'POST':
        return await http.post(url, headers: headers);
      case 'PUT':
        return await http.put(url, headers: headers);
      case 'PATCH':
        return await http.patch(url, headers: headers);
      case 'HEAD':
        return await http.head(url, headers: headers);
      default:
        throw ArgumentError('Invalid HTTP method $method');
    }

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

