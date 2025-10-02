import 'package:dio/dio.dart';

class DioClient {
  static Dio getClient() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/auth',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}
