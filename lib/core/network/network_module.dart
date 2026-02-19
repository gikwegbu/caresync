import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        baseUrl: 'https://api.caresync.com/v1',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ));

  @lazySingleton
  RestClient get restClient => RestClient(dio);
}
