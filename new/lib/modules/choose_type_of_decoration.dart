import 'package:flutter/material.dart';
import 'package:untitled10/modules/details_of_type_decoration.dart';
import 'package:untitled10/modules/places_of_decoration.dart';

class ChooseTypeOfDecoration extends StatelessWidget {
  const ChooseTypeOfDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xfffdb1a1),
),
 body:Padding(
   padding: const EdgeInsets.all(4.0),
   child: SingleChildScrollView(
     child: Column(
       children: [
         GridView.count(
        shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           crossAxisCount: 2,
         crossAxisSpacing: 5,
         mainAxisSpacing: 5,
         children: List.generate(15

             , (context1)=>
         GestureDetector(
           onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsOfTypeDecoration()));
           },
           child: Stack(
             children: [Container(
               width: 160,
               height: 160,

               decoration: BoxDecoration(
                 color: Colors.blue[200],
                 borderRadius: BorderRadius.circular(100),

               ),

             ),
               Column(
                 children: [
                   Expanded(
                     child: CircleAvatar(

                       backgroundImage: AssetImage(
                           'assets/images/shopping.webp'
                       ),
                       backgroundColor: Colors.indigo,
                       radius:300,


                     ),
                   ),
                   SizedBox(
                     height: 5,
                   ),
                   Text(
                       'Balon',
                       style: TextStyle(
                         fontStyle: FontStyle.italic,
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       )
                   )
                 ],
               ),
         ]  ),
         )),)

       ],
     ),
   ),
 )

    );
  }
}
