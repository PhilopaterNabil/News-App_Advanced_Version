import 'package:dio/dio.dart';
import 'package:task_ninja_flutter/core_API/API/API_consumer.dart';
import 'package:task_ninja_flutter/core_API/errors/exceptions.dart';

class DioConsumer extends APIConsumer {
  final Dio dio ;

  DioConsumer({required this.dio});
  @override
  Future delete (String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFromData= false}) async {
   try {
   final response = await dio.delete(path) ;
   return response.data ;
   }
    on DioException catch (e){
      handleExceptionError(e) ;
    }
  }

  @override
  Future get(String path, { Object? data , Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await dio.get(
        path ,
        data: data ,
        queryParameters: queryParameters,
        );
        return response.data ;
    }
    on DioException catch (e){
      handleExceptionError(e) ;
    }
  }

  @override
  Future patch(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFromData= false}) async {
    try{
      final response = await dio.get(
        path ,
        data: data ,
        queryParameters: queryParameters,
        );
        return response.data ;
    }
    on DioException catch (e){
      handleExceptionError(e) ;
    }
  }

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFromData  = false}) async {
    try{
      final response = await dio.get(
        path ,
        data: data ,
        queryParameters: queryParameters,
        );
        return response.data ;
    }
    on DioException catch (e){
      handleExceptionError(e) ;
    }
  }

}



