import 'package:dio/dio.dart';

class RestClient {
  final Dio _dio;
  final String? baseUrl;

  RestClient(this._dio, {this.baseUrl});

  Future<String> checkHealth() async {
    final result = await _dio.get('/health');
    return result.data.toString();
  }
}
