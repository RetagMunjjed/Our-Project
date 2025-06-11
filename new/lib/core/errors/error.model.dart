



import 'package:untitled10/core/errors/endpoints.dart';

class ErrorModel {

  final  String  errorMessage;

  ErrorModel( this.errorMessage);
   factory ErrorModel.fromJson(Map<String,dynamic>jsonData
      ){
     return ErrorModel(
          jsonData[ApiKey.errormessage]);
   }





}