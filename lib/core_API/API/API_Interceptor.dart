import 'package:dio/dio.dart';
import 'package:task_ninja_flutter/cache/cache_helper.dart';
import 'package:task_ninja_flutter/core_API/API/end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest ( RequestOptions options , RequestInterceptorHandler handler ){
    options.headers[APIKey.token] = CacheHelper().getData(key: APIKey.token) != null 
    ? 'FOODAPI ${CacheHelper().getData(key: APIKey.token)}' : null ;
    super.onRequest(options, handler);
  }
}