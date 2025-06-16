
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/cubit/stars_cubit.dart';
import 'package:untitled10/cubit/stars_status.dart';
import 'package:untitled10/modules/camera.dart';
import 'package:untitled10/modules/choose_type_of_decoration.dart';
import 'package:untitled10/modules/choose_type_of_food.dart';
import 'package:untitled10/modules/music.dart';
import 'package:untitled10/modules/reservation.dart';

class Halldaetails extends StatelessWidget {
  Halldaetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context )=>Stars_Cubit(),
        child: BlocConsumer<Stars_Cubit,Stars_Status>(
        listener: (BuildContext context , Stars_Status status){},
    builder: (BuildContext context , Stars_Status status){
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Color(0xfffdb1a1),
    title: Text("صفحة القاعة")
    ),
    body: Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListView(
    children: [
    Image.asset("assets/images/shopping.webp"),
    SizedBox(
    height: 10,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    children: [
    Image.asset(
    "assets/images/shopping.webp",
    width: 70,
    ),
    SizedBox(
    width: 10,
    ),
    Image.asset(
    "assets/images/shopping.webp",
    width: 70,
    ),
    SizedBox(
    width: 10,
    ),
    Image.asset(
    "assets/images/shopping.webp",
    width: 70,
    ),
    SizedBox(
    width: 10,
    ),
    Image.asset(
    "assets/images/shopping.webp",
    width: 70,
    ),
    SizedBox(
    width: 10,
    ),
    Image.asset(
    "assets/images/shopping.webp",
    width: 70,
    ),
    ],
    ),
    ),
    SizedBox(
    height: 15,
    ),
    Text(
    "Paris Halls",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
    SizedBox(
    height: 15,
    ),
    Row(
    children: [
    Row(
    children: [
    IconButton(icon:Stars_Cubit.get(context).stars[0]? Icon(Icons.star_border_outlined):Icon(Icons.star),
    onPressed: ( ){
         Stars_Cubit.get(context).addStars(0);
         Stars_Cubit.get(context).increaseCount();
    },),
    IconButton(icon: Stars_Cubit.get(context).stars[1]? Icon(Icons.star_border_outlined):Icon(Icons.star),
    onPressed: (){
      Stars_Cubit.get(context).addStars(1);
      Stars_Cubit.get(context).increaseCount();
    },),
    IconButton(icon:Stars_Cubit.get(context).stars[2]? Icon(Icons.star_border_outlined):Icon(Icons.star),
    onPressed: (){
      Stars_Cubit.get(context).addStars(2);
      Stars_Cubit.get(context).increaseCount();
    },),
    IconButton(icon: Stars_Cubit.get(context).stars[3]? Icon(Icons.star_border_outlined):Icon(Icons.star),
    onPressed: (){
      Stars_Cubit.get(context).addStars(3);
      Stars_Cubit.get(context).increaseCount();
    },),
    IconButton(icon: Stars_Cubit.get(context).stars[4]? Icon(Icons.star_border_outlined):Icon(Icons.star),
    onPressed: (){
      Stars_Cubit.get(context).addStars(4);
      Stars_Cubit.get(context).increaseCount();
    },),
    ],
    ),
    Spacer(),
    Icon(Icons.favorite_outline),


    ],
    ),
    SizedBox(
    height: 15,
    ),
    Row(
    children: [
    Icon(Icons.place),
    SizedBox(
    width: 10,
    ),
    Text(
    "Mazzeh",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    ],
    ),
    SizedBox(
    height: 10,
    ),
    Text("العنوان بالتفصيل"),
    SizedBox(
    height: 20,
    ),
    Divider(),
    Row(
    children: [Icon(Icons.people), Text(" 1000 - 2000 guest")],
    ),
    SizedBox(
    height: 10,
    ),
    Divider(),
    Row(
    children: [
    Text(
    "Price: ",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Text(
    "600\$",
    style: TextStyle(fontSize: 18),
    )
    ],
    ),
    Divider(),
    Text(
    "Services",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
    Row(
    children: [
    Container(
    width: 160,
    height: 70,
    child: InkWell(
    onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChooseTypeOfFood()));
    },
    child: Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Food     ",
    style: TextStyle(fontSize: 18),
    ),
    Icon(Icons.restaurant)
    ],
    ),
    )),
    ),
    Container(
    width: 160,
    height: 70,
    child: InkWell(
    onTap: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Music()));
    },
    child: Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Music     ",
    style: TextStyle(fontSize: 18),
    ),
    Icon(Icons.music_note)
    ],
    ),
    )),
    )
    ],
    ),
    SizedBox(
    height: 10,
    ),
    Row(
    children: [
    Container(
    width: 160,
    height: 70,
    child: InkWell(
    onTap: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Camera()));
    },
    child: Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Filming     ",
    style: TextStyle(fontSize: 18),
    ),
    Icon(Icons.camera_alt)
    ],
    ),
    )),
    ),
    Container(
    width: 160,
    height: 70,
    child: InkWell(
    onTap: () {},
    child: Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    " Team     ",
    style: TextStyle(fontSize: 18),
    ),
    Icon(Icons.people)
    ],
    ),
    )),
    )
    ],
    ),
    SizedBox(
    height: 10,
    ),
    Row(
    children: [
    Container(
    width: 160,
    height: 70,
    child: InkWell(
    onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChooseTypeOfDecoration()));
    },
    child: Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    " Design     ",
    style: TextStyle(fontSize: 18),
    ),
    Icon(Icons.design_services_sharp)
    ],
    ),
    )),
    ),
    ],
    ),
    SizedBox(
    height: 10,
    ),
    Divider(),
    Text(
    "The latest occasions",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    SizedBox(
    height: 10,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    children: [
    Card(
    child: Column(
    children: [
    Image.asset(
    "assets/images/shopping.webp",
    width: 150,
    height: 250,
    ),
    Text("Birthday")
    ],
    )),
    SizedBox(
    width: 10,
    ),
    Card(
    child: Column(
    children: [
    Image.asset(
    "assets/images/shopping.webp",
    width: 150,
    height: 250,
    ),
    Text("Birthday")
    ],
    )),
    SizedBox(
    width: 10,
    ),
    Card(
    child: Column(
    children: [
    Image.asset(
    "assets/images/shopping.webp",
    width: 150,
    height: 250,
    ),
    Text("Birthday")
    ],
    )),
    ],
    ),
    ),
    SizedBox(
    height: 10,
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    width: 100,
    child: MaterialButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30)),
    color: Colors.blue,
    onPressed: () {},
    child: Text(
    "Available times",
    style: TextStyle(color: Colors.white),
    ),
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    width: 100,
    child: MaterialButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30)),
    color: Colors.blue,
    onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Reservation()));
    },
    child: Text(
    "Reservation the hall",
    style: TextStyle(color: Colors.white),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    );
    })
    );
  }
}
