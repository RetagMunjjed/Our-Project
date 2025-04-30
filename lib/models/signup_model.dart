class SignupModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String confirmpassword;

  SignupModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });
  factory SignupModel.fromJson(Map<String, dynamic> jsondata) {
    return SignupModel(
        id: jsondata["id"],
        name: jsondata['name'],
        email: jsondata['email'],
        password: jsondata['password'],
    confirmpassword:jsondata["confirmpassword"]
    );
  }
}
