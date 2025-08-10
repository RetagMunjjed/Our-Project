import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        "Bearer 13|xHkd7a2r3GMpK0FXYiXEyXcz6nq9ilwt97tzPcgDcf6c229e";
    handler.next(options);
  }
}
