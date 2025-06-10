import 'package:events/models/halls_model.dart';
import 'package:events/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class SignInLoading extends UserState {}

class UploadProfilePic extends UserState {}

class SignInSuccess extends UserState {}

class SignInFailure extends UserState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}

class SignUpLoading extends UserState {}

class SignUpSuccess extends UserState {
  final String message;
  SignUpSuccess({required this.message});
}

class SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

class GetUserLoading extends UserState {}

class GetUserSuccess extends UserState {
  final UserModel user;
  GetUserSuccess({required this.user});
}

class GetUserFaliure extends UserState {
  final String errMessage;
  GetUserFaliure({required this.errMessage});
}

class GetHallsLoading extends UserState {}

class GetHallsSuccess extends UserState {
  final List<HallsModel> halls;
  GetHallsSuccess({required this.halls});
}

class GetHallsFaliure extends UserState {
  final String message;
  GetHallsFaliure({required this.message});
}
