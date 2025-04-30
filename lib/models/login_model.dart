class LoginModel {
  final String message;
  final String token;
  final int id;

  LoginModel({
    required this.message,
    required this.token,
    required this.id,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      message: jsonData["message"], // تأكد من الاسم الصحيح في الـ JSON
      token: jsonData["token"],
      id: jsonData["id"],
    );
  }
}