 import 'package:dio/dio.dart';
import 'package:untitled10/core/errors/error.model.dart';



class serverExceptions implements Exception{
final ErrorModel errModel ;

  serverExceptions(this.errModel);





 }



 void handelDioException(DioException e) {
   switch (e.type) {
     case DioExceptionType.connectionTimeout:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.sendTimeout:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.receiveTimeout:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.badCertificate:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.cancel:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.connectionError:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.unknown:
       throw serverExceptions(ErrorModel.fromJson(e.response?.data));
     case DioExceptionType.badResponse:
       switch (e.response?.statusCode) {
         case 400 : //bad request
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
         case 401 : //unauthorized
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
         case 403 : // forbidden
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
         case 404 : // not found
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
         case 409 : // cofficient
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
         case 422 : // unprocessable entity
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
         case 504 : // server exception
           throw serverExceptions(ErrorModel.fromJson(e.response?.data));
       }
   }
 }