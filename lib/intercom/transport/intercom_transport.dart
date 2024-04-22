
import '../client.dart';

abstract class IntercomTransport {
  final String baseURL;
  final Authorization auth;

  const IntercomTransport({
    required this.auth,
    required this.baseURL,
  });

  Future<T> get<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<T> delete<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<T> post<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<T> put<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<T> patch<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<T> head<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<T> options<T>(String path, {
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

}

