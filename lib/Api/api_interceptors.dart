import 'package:dio/dio.dart';
import 'package:event/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        ' Bearer ${CacheHelper.getData(key: 'token')}';
    //options.headers['Accept_language']='en';
    super.onRequest(options, handler);
  }
} //للتحكم في الريكويست والرسبونس
