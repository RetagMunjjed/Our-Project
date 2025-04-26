// import 'package:flutter/material.dart';

// class Events extends StatelessWidget {
//   const Events({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size disize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               Container(
//                 color: Colors.white,
//                 height: disize.height,
//                 width: disize.width * .5,
//               ),
//               Container(
//                 color: Color(0xff181d3d),
//                 height: disize.height,
//                 width: disize.width * .5,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius:
//                         BorderRadius.only(bottomRight: Radius.circular(75))),
//                 height: disize.height * .5,
//                 width: disize.width,
//                 child: Center(
//                   child: Text(
//                     "BIRTHDAY",
//                     style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xff181d3d)),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xff181d3d),
//                       borderRadius:
//                           BorderRadius.only(topLeft: Radius.circular(75))),
//                   height: disize.height * .5,
//                   width: disize.width,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 35,
//                         ),
//                         Container(
//                             width: 300,
//                             height: 400,
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   "images/rest.jpg",
//                                   width: 250,
//                                   height: 300,
//                                 ),
//                                 Text(
//                                   "Restuarant",
//                                   style: TextStyle(color: Colors.white),
//                                 )
//                               ],
//                             )),
//                         SizedBox(
//                           width: 35,
//                         ),
//                         Container(
//                             width: 300,
//                             height: 400,
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   "images/cafe.jpg",
//                                   width: 250,
//                                   height: 300,
//                                 ),
//                                 Text(
//                                   "Cafe",
//                                   style: TextStyle(color: Colors.white),
//                                 )
//                               ],
//                             )),
//                         SizedBox(
//                           width: 35,
//                         ),
//                         Container(
//                             width: 300,
//                             height: 400,
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   "images/sale.jpg",
//                                   width: 250,
//                                   height: 300,
//                                 ),
//                                 Text(
//                                   "sale",
//                                   style: TextStyle(color: Colors.white),
//                                 )
//                               ],
//                             )),
//                         SizedBox(
//                           width: 35,
//                         ),
//                         Container(
//                             width: 300,
//                             height: 400,
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   "images/hous.jpg",
//                                   width: 250,
//                                   height: 300,
//                                 ),
//                                 Text(
//                                   "Hous",
//                                   style: TextStyle(color: Colors.white),
//                                 )
//                               ],
//                             )),
//                       ],
//                     ),
//                   )),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
