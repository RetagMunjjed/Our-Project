import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor{

  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    options.headers['Authorization'] = 'Bearer 3|pTDPeqZzmW2uWcwRVToJjUJtugHco9QXxWHW88uwadc0a706';
    handler.next(options);
  }




}