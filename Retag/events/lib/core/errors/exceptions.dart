import 'package:dio/dio.dart';
import 'package:events/core/errors/erroe_model.dart';

class ServerException implements Exception {
  final ErroeModel erroeModel;
  ServerException({required this.erroeModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(erroeModel: ErroeModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad request
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));

        case 401: //unauthorized
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));

        case 403: //firbidden
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));

        case 404: //not found
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));

        case 409: //cofficient
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));

        case 422: //Unprocessable Entity
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));

        case 504: //Server exception
          throw ServerException(
              erroeModel: ErroeModel.fromJson(e.response!.data));
      }
  }
}
