import 'package:dio/dio.dart';
import 'package:news_app_team/core/Api/api_consumer.dart';
import 'package:news_app_team/core/Api/api_interceptors.dart';
import 'package:news_app_team/core/Api/end_point.dart';
import 'package:news_app_team/core/Error/exceptions.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;

  // Setting up DioConsumer with Dio
  DioConsumer({required this.dio}) {
    // Set the base URL for requests
    dio.options.baseUrl = EndPoint.baseUrl;
    // Add interceptors for requests
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true));
  }

  // Function to delete data from the server
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      // Execute delete request
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      // Return the response data
      return response.data;
    } on DioException catch (e) {
      // Handle exceptions from the request
      handleDioExceptions(e);
    }
  }

  // Function to get data from the server
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      // Execute get request
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      // Return the response data
      return response.data;
    } on DioException catch (e) {
      // Handle exceptions from the request
      handleDioExceptions(e);
    }
  }

  // Function to partially update data on the server
  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      // Execute patch request
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      // Return the response data
      return response.data;
    } on DioException catch (e) {
      // Handle exceptions from the request
      handleDioExceptions(e);
    }
  }

  // Function to create data on the server
  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      // Execute post request
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      // Return the response data
      return response.data;
    } on DioException catch (e) {
      // Handle exceptions from the request
      handleDioExceptions(e);
    }
  }
}
