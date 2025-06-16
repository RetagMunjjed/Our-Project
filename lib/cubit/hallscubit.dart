
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled10/core/api.consumer.dart';
import 'package:untitled10/core/errors/endpoints.dart';
import 'package:untitled10/core/errors/exceptions.dart';
import 'package:untitled10/cubit/halls_status.dart';
import 'package:untitled10/models/halls_model.dart';

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


  getHalls() async {
    try {
      emit(GetHallsLoading());

      final response = await api.get(
        EndPoints.getHallsDataEndPoint( 2),
      );
      print("Response: $response");
      // تأكد أن response['halls'] هي قائمة
      final List<HallsModel> hallsList =
      HallsModel.fromJsonList(response['halls']);
      emit(GetHallsSuccess(halls: hallsList));
    } on serverExceptions catch (e) {
      emit(GetHallsFaliure(message: e.errModel.errorMessage));
    }
  }
}
