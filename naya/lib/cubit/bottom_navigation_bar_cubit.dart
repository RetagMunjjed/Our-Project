import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/cubit/bottom_navigation_bar_status.dart';
import 'package:untitled10/modules/home_page.dart';
import 'package:untitled10/modules/orders_of_user.dart';
import 'package:untitled10/modules/profile_of_user.dart';

class cubit_bottom_navigation_bar extends Cubit<Status_bottom_navigation_bar>{

cubit_bottom_navigation_bar():super(inital_bottom());

static cubit_bottom_navigation_bar get(context)=>BlocProvider.of(context);

int  ontap_index_forChangingScreen=0;


// this is a list contain the screens to change the screen when the user top on the specific icon //

List<Widget> Screens =[

  const HomePage(),
  const OrdersOfUser(),
  const ProfileOfUser()

];

// this is a list which contain titles to use in appbar //
List<String> Titles=[
  "Home",
  "Orders",
  "Profile"
];

// this is a function which changing the screen //

void function_to_change_the_screens (int theCurrentIndex){

  ontap_index_forChangingScreen=theCurrentIndex;

  emit(status_of_changing_screens());
}

/*
* new screen => type of product                   */

bool changeFromAddIconToAddedSuccessfully =false;

void function_changeFromAddIconToAddedSuccessfully (){

  changeFromAddIconToAddedSuccessfully=!changeFromAddIconToAddedSuccessfully;
   emit(status_of_changing_Add_icons());
}

}