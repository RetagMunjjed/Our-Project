part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoginInitial extends RegisterState {}

class Loginsuccess extends RegisterState {}

class Loginloading extends RegisterState {}

class Loginfailure extends RegisterState {
  final String errMessage;

  Loginfailure({required this.errMessage});
}

class SignupInitial extends RegisterState {}

class Signupsuccess extends RegisterState {

}

class Signuploading extends RegisterState {}

class Signupfailure extends RegisterState {
  final String errMessage;

  Signupfailure({required this.errMessage});
}
