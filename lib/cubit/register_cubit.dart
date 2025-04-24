import 'package:bloc/bloc.dart';
import 'package:events/models/signup_model.dart';
import 'package:events/repositries/user_ropository.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

import '../Api/api_consumer.dart';
import '../Api/endpoint.dart';
import '../Api/exception.dart';
import '../models/login_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.userrepository) : super(RegisterInitial());
  //final ApiConsumer api;
  final UserRepository userrepository;
  //sign in from key
  GlobalKey<FormState> loginFromKey = GlobalKey();
  //sign in email
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  //sinup form key
  GlobalKey<FormState> signupFromKey = GlobalKey();
  // XFile? profilepic; لتحميل الصورة
  TextEditingController signUpName = TextEditingController();
  TextEditingController signupPhonNumber = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  LoginModel? user;
  loginUser() async {
    emit(Loginloading());
    final response=await userrepository.login(email: loginEmail.text, password: loginPassword.text);
    response.fold((errMessage)=>emit(Loginfailure(errMessage: errMessage)), (LoginModel)=>emit(Loginsuccess( )))
    // emit(Loginloading());
    // try {
    //   final response = await api.post(Endpoint.login, data: {
    //     ApiKey.email: loginEmail.text,
    //     ApiKey.password: loginPassword.text
    //   }); //http.post
    //   user = LoginModel.fromJson(response);
    //   final decodedToken = JwtDecoder.decode(user!.token);
    //   print(decodedToken['id']);
    //   emit(Loginsuccess());
    //   print(response);
    // } on serverException catch (e) {
    //   emit(Loginfailure(errMessage: e.errorModel.errorMessage));
    //   // TODO
    // }
  }
  signup() async {
    emit(Signuploading());
  final response= await userrepository.signup(
        name: signUpName.text,
        email: signupEmail.text,
        password: signupPassword.text,
        confirmpassword: confirmPassword.text,
        phone: signupPhonNumber.text);
 response.fold((errMasseg)=>emit(Signupfailure(errMessage:errMasseg)), (SignupModel)=>emit(Signupsuccess(message:SignupModel.message))) }
}
