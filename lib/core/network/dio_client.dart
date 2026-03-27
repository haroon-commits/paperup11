import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioClient {
  final Dio dio;
  final Logger logger = Logger();

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.paperup.test', // Placeholder
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => logger.d(obj),
    ));
    
    // JWT Interceptor would go here
  }
}
