import 'package:flutter/foundation.dart';

import 'articles.dart';
import 'tags.dart';
import 'transport/impl/intercom_http_transport.dart';
import 'transport/intercom_transport.dart';

class Client {
  @protected
  final IntercomTransport transport;

  Client.accessToken(String accessToken, {
    IntercomTransport? transport,
  }) : transport = transport ?? ClientHTTP.defaultTransport(
    auth: AccessTokenAuthorization(accessToken: accessToken),
    baseURL: 'api.intercom.io',
  );

  late final tags = Tags(this);
  late final articles = Articles(this);
}

extension ClientHTTP on Client {
  static IntercomTransport Function({
    required Authorization auth,
    required String baseURL,
  }) get defaultTransport => HTTPIntercomTransport.new;

  Future<T> get<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.get(path, query: query, decoder: decoder);
  }

  Future<T> post<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.post(path, query: query, decoder: decoder);
  }

  Future<T> put<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.put(path, query: query, decoder: decoder);
  }

  Future<T> patch<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.patch(path, query: query, decoder: decoder);
  }

  Future<T> delete<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.delete(path, query: query, decoder: decoder);
  }

  Future<T> head<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.head(path, query: query, decoder: decoder);
  }

  Future<T> options<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) async {
    return transport.options(path, query: query, decoder: decoder);
  }
}

abstract class Authorization {
  String get header;
}

class AccessTokenAuthorization implements Authorization {
  final String accessToken;

  const AccessTokenAuthorization({required this.accessToken});

  @override
  String get header => 'Bearer $accessToken';
}