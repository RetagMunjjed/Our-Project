import 'package:flutter/material.dart';
import 'package:untitled10/modules/details_of_food.dart';
class model {
  final String name;

  model(this.name);

}
class ChooseTypeOfFood extends StatelessWidget {
   ChooseTypeOfFood({super.key});
List<model>modell=[
  model('Drinks'),
  model('Main meal'),
  model('Deserts'),
  model('Cake'),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffdb1a1),

      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                               mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Icon(Icons.keyboard_arrow_down_outlined),
                        SizedBox(
                          width: 2,
                        ),
                        Text('Food',style: TextStyle(
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
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(modell.length

                    , (index)=>
                        GestureDetector(
                          onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsOfFood()));
                          },
                          child: Container(
                            width: 220,
                            height: 200,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200]
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 200 ,
                                  height: 150,
                                  child: Image(image: AssetImage("assets/images/flat-food-poster-template_23-2149046595.jpg"),
                                    fit:    BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('${modell[index].name}',
                                style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,

                                ),)

                              ],
                            ),
                          )
                        )),)

            ],
          ),
        ),
      ),
    );

  }
}
