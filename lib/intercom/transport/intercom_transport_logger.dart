abstract interface class IntercomTransportLogger {

  void onRequest(String method, String url, {
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, dynamic?> headers,
  });

  void onResponse(String method, String url, {
    dynamic body,
    int statusCode,
    Map<String, dynamic>? headers,
  });

}