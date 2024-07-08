import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  ///~ Called when the request is about to be sent.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[''] = '';
    super.onRequest(options, handler);
  }
}
