import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/cubit/bottom_navigation_bar_cubit.dart';
import 'package:untitled10/cubit/bottom_navigation_bar_status.dart';
import 'package:untitled10/modules/details_of_type_decoration.dart';

class PlacesOfTypes extends StatelessWidget {
   PlacesOfTypes({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>cubit_bottom_navigation_bar(),
      child: BlocConsumer<cubit_bottom_navigation_bar,Status_bottom_navigation_bar>(
        listener: (context,Status_bottom_navigation_bar status){},
        builder: (context,Status_bottom_navigation_bar status){

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){

                },
                    icon: Icon(Icons.list_outlined,size: 30,color: Colors.black,))
              ],
              backgroundColor: Color(0xfffdb1a1),
            ),
            body:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [


                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index) =>mycolumn(context),
                        itemCount: 15,
                        separatorBuilder: (context,index)=> SizedBox(
                          height: 5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ) ,
          );
        },
      )


    );
  }
}

Widget mycolumn (BuildContext context){



  return  Container(
    width: double.infinity,

    color: Colors.white60,
    child: Column(

      children: [
        SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: (){

          },
          child: Container(

             height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white60
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
                image: AssetImage(
              "assets/images/shopping.webp",

            ),

           fit: BoxFit.fill       ),

          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
            ),
            Text("on tabels",
              style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.bold,)),
           Spacer(),
            IconButton(
                onPressed: (){
                cubit_bottom_navigation_bar.get(context).function_changeFromAddIconToAddedSuccessfully();
            },
                icon: cubit_bottom_navigation_bar.get(context).changeFromAddIconToAddedSuccessfully?  Icon(Icons.offline_pin_outlined,color: Colors.deepOrange,size: 30,):Icon(Icons.add_box,color: Colors.deepOrange,size: 30,),),
            SizedBox(
              width: 40,
            )
          ],
        ),

      ],
    ),
  );
}