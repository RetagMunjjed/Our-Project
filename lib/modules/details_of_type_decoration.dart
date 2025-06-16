import 'package:flutter/material.dart';
import 'package:untitled10/modules/places_of_decoration.dart';

class DetailsOfTypeDecoration extends StatelessWidget {
  const DetailsOfTypeDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffdb1a1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SingleChildScrollView(
          child: Column(

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: BorderDirectional(
                       top: BorderSide(color: Colors.blue,width:2 ),
                        bottom: BorderSide(color: Colors.blue,width:2 ),
                        start: BorderSide(color: Colors.blue,width:2 ),
                        end:  BorderSide(color: Colors.blue,width:2 ),

                      ),

                    ),
                    child:
                    Center(child: Row(

                      children: [
                         Icon(Icons.keyboard_arrow_down_outlined),
                        SizedBox(
                          width: 2,
                        ),
                        Text('Flower',style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,

                        ) ,),
                      ],
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index)=> Container(
                    color: Colors.grey[200],

                    child: Column(
                      children: [
                        SizedBox(
                         height:  5
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          height:200 ,
                          width:350,
                          child: Image(image:
                          AssetImage("assets/images/images.jpg",

                          ),
                            fit: BoxFit.fill,

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                         // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          SizedBox(
                            width: 20,
                          ),
                            Text(
                              'Price:1200'
                              ,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            Spacer(),
                            Text(
                              'tulipe'
                                  ,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlacesOfTypes()));
                                },
                                icon:Icon(Icons.arrow_circle_left_outlined,size: 30,) ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              width: 70,

                              child: Center(
                                child: Text('Blue',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                              ),
                            ) ,
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              width: 70,

                              child: Center(
                                child: Text('Red',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                              ),
                            ) ,
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: 70,
                             
                              child: Center(
                                child: Text('White',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ),
                            ) ,
                            SizedBox(
                              width:15,
                            )
                            

                          ],
                        )
                      ],
                    ),

                  ) ,
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 10,
                  ) ,
                  itemCount: 14)
            ],
          ),
        ),
      ),
    );
  }
}

