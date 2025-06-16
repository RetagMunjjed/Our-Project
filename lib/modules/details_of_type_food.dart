import 'package:flutter/material.dart';

class DetailsOfTypeFood extends StatelessWidget {
  const DetailsOfTypeFood({super.key});

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
                        Text('Jucies',style: TextStyle(
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
                              'Lemonada'
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

                            TextButton(onPressed:() {
                             showAboutDialog(context: (context),children: [
                               TextFormField(
                                 decoration: InputDecoration(
                                   label: Text('add your note'),
                                 ),
                               )
                             ]);
                            }, child:
                            Text('buy',
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                            )
                            ),


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
