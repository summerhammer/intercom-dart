abstract interface class IntercomTransportLogger {

  void onRequest(String method, String url, {
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, dynamic>? headers,
  });

  void onResponse(String method, String url, {
    required int statusCode,
    dynamic body,
    Map<String, dynamic>? headers,
  });

  void onError(String method, String url, {
    required dynamic error,
  });
}