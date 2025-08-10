import 'package:events/core/api/end_points.dart';

class RegisterModel {
  final String message;
  RegisterModel({required this.message});
  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(message: jsonData[ApiKey.message]);
  }
}
