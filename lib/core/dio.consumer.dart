import 'package:dio/dio.dart';
import 'package:untitled10/core/api.consumer.dart';
import 'package:untitled10/core/errors/api.interceptor.dart';
import 'package:untitled10/core/errors/endpoints.dart';
import 'package:untitled10/core/errors/exceptions.dart';


class DioConsumer extends  ApiConsumer{
  final Dio dio ;

  DioConsumer(this.dio){
    dio.options.baseUrl=EndPoints.baseUrl;
    dio.options.followRedirects = true; // أضف هذا السطر
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true
    ));
  }
  @override
  Future Patch(String path, {dynamic? data, Map<String, dynamic>? queryParamerters,bool isFormData=false}) async{
    try{
      final response = await dio.patch(
          path,
          data: isFormData?FormData.fromMap(data) : data,
          queryParameters: queryParamerters);
      return response.data;
    } on DioException catch(e){
      handelDioException(e);
    }
  }




  @override
  Future delete(String path, {dynamic? data, Map<String, dynamic>? queryParamerters,bool isFormData=false}) async{
    try{
      final response = await dio.delete(path,
          data: isFormData?FormData.fromMap(data) : data,
          queryParameters: queryParamerters);
      return response.data;
    } on DioException catch(e){
      handelDioException(e);
    }
  }

  @override
  Future get(String path, {dynamic? data, Map<String, dynamic>? queryParamerters,bool isFormData=false}) async{
    try{
      final response = await dio.get(path,
          data: isFormData?FormData.fromMap(data) : data,
          queryParameters: queryParamerters);
      return response.data;
    } on DioException catch(e){
      handelDioException(e);
    }
  }

  @override
  Future post(String path, {dynamic? data, Map<String, dynamic>? queryParamerters,bool isFormData=false}) async{
    try{
      final response = await dio.post(path,
          data: isFormData?FormData.fromMap(data) : data,
          queryParameters: queryParamerters);
      return response.data;
    } on DioException catch(e){
      handelDioException(e);
    }
  }


}