import 'package:events/cach/cach_helper.dart';
import 'package:events/core/api/api_consumer.dart';
import 'package:events/core/api/end_points.dart';
import 'package:events/core/errors/exceptions.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:events/models/halls_model.dart';
import 'package:events/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  TextEditingController logInemail = TextEditingController();
  TextEditingController logInPassword = TextEditingController();
  XFile? profilePic;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController CongirmPassword = TextEditingController();
  LogInModel? user;
  // uploadProfilePic(XFile image) {
  //   profilePic = image;
  //   emit(UploadProfilePic());
  // }

  // signIn() async {
  //   try {
  //     emit(SignInLoading());
  //     final response = await api.post(EndPoint.signIn, data: {
  //       ApiKey.email: logInemail.text,
  //       ApiKey.password: logInPassword.text
  //     });
  //     user = LogInModel.fromJson(response);
  //     final decodedToken = JwtDecoder.decode(user!.token);
  //     CachHelper().saveData(key: ApiKey.token, value: user!.token);
  //     CachHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //     emit(SignInSuccess());
  //   } on ServerException catch (e) {
  //     emit(SignInFailure(errMessage: e.erroeModel.message));
  //   }
  // }

  // signUp() async {
  //   try {
  //     emit(SignUpLoading());
  //     final response = await api.post(
  //         EndPoint.signUp
  //         //حطينا فروم داتا لانو بالبوست مان محطوط المعلومات بالجدول مو {} جوا القوسين ك body مكتوب بالجيسون
  //         ,
  //         isFromData: true,
  //         data: {
  //           ApiKey.name = signUpName.text,
  //           ApiKey.email = signUpEmail.text,
  //           ApiKey.password = signUpPassword.text,
  //           ApiKey.password_confirmation = CongirmPassword.text,
  //           ApiKey.phone = signUpPhoneNumber.text
  //           //هي كرمال ارفع صورة من ال API
  //           //Apikey.profilrPic:await uploadImageToApi(profilrPic!);
  //         });
  //     final registerModel = RegisterModel.fromJson(response);
  //     emit(SignUpSuccess(message: registerModel.message));
  //   } on ServerException catch (e) {
  //     emit(SignUpFailure(errMessage: e.erroeModel.message));
  //   }
  // }

  // getUserProfile() async {
  //   try {
  //     emit(GetUserLoading());
  //     final response = await api.get(
  //         EndPoint.getUserDataEndPoint(CachHelper().getData(key: ApiKey.id)));
  //     emit(GetUserSuccess(user: UserModel.fromJson(response)));
  //   } on ServerException catch (e) {
  //     emit(GetUserFaliure(errMessage: e.erroeModel.errorMessage));
  //   }
  // }
  getHalls() async {
    try {
      emit(GetHallsLoading());

      final response = await api.get(
        EndPoint.getHallsDataEndPoint(CachHelper().getData(key: ApiKey.id)),
      );
      print("Response: $response");
      // تأكد أن response['halls'] هي قائمة
      final List<HallsModel> hallsList =
          HallsModel.fromJsonList(response['halls']);
      emit(GetHallsSuccess(halls: hallsList));
    } on ServerException catch (e) {
      emit(GetHallsFaliure(message: e.erroeModel.message));
    }
  }
}
