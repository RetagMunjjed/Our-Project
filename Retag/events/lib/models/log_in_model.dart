import 'package:events/core/api/end_points.dart';

class LogInModel {
  final String message;
  final String token;
  LogInModel({required this.message, required this.token});
  factory LogInModel.fromJson(Map<String, dynamic> jsonData) {
    return LogInModel(
        message: jsonData[ApiKey.message], token: jsonData[ApiKey.token]);
  }
}
