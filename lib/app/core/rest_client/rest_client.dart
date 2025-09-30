import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://10.24.24.247:8080';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  RestClientException({
    this.code,
    required this.message,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
