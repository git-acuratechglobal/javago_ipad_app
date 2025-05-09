import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/dio_exception.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.options = BaseOptions(
    // baseUrl: "https://192.168.4.218/javago-cafe-admin/cafe-api",
    baseUrl: "http://18.132.176.176/cafe-api",
    responseType: ResponseType.json,
    receiveTimeout: const Duration(minutes: 2),
    sendTimeout: const Duration(minutes: 2),
    connectTimeout: const Duration(minutes: 2),
  );
  dio.interceptors.add(LogInterceptor(
      requestBody: true, responseBody: true, requestHeader: true));
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        final message = DioExceptions.fromDioError(e);
        return handler.reject(
          DioException(requestOptions: e.requestOptions, error: message),
        );
      },
    ),
  );
  return dio;
});