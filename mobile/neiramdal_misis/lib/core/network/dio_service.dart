import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  factory DioService() => _instance;
  DioService._internal();

  late Dio _client;
  String? _baseUrl;

  Dio get client => _client;

  void init() {
    _baseUrl = 'http://127.0.0.1:8000/api/auth';

    _client = Dio(
      BaseOptions(
        baseUrl: _baseUrl!,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _client.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );

    _client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('Making request to: ${options.uri}');
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          debugPrint('Dio Error: ${error.message}');
          debugPrint('Error Type: ${error.type}');
          debugPrint('Error Response: ${error.response}');
          return handler.next(error);
        },
      ),
    );
  }

  void setAuthToken(String token) {
    _client.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    _client.options.headers.remove('Authorization');
  }

  String? get baseUrl => _baseUrl;
}
