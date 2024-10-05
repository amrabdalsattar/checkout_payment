import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_factory.dart';

@Injectable(as: ApiFactory)
class DioFactory extends ApiFactory {
  late Dio dio;
  DioFactory({required this.dio}) {
    final options = BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
        headers: {'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}'});
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response =
          await dio.delete(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      e.toString();
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      e.toString();
    }
  }

  @override
  Future patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response =
          await dio.patch(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      e.toString();
    }
  }

  @override
  Future post(String path,
      {Object? data,
      String? contentType,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      e.toString();
    }
  }

  @override
  Future put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response =
          await dio.put(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      e.toString();
    }
  }
}
