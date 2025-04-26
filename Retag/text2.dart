// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // appBar: AppBar(title: Text('Events')),
//         body: EventsScreen(),
//       ),
//     );
//   }
// }

// class EventsScreen extends StatefulWidget {
//   @override
//   _EventsScreenState createState() => _EventsScreenState();
// }

// class _EventsScreenState extends State<EventsScreen> {
//   String? expandedEvent; // قيمتها: 'birthday', 'wedding', 'engagement'

//   void toggleEvent(String eventName) {
//     setState(() {
//       if (expandedEvent == eventName) {
//         expandedEvent = null; // إغلاق إذا ضغط مرة ثانية
//       } else {
//         expandedEvent = eventName; // فتح الحدث المطلوب وإغلاق الباقي
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Image.asset(
//             'images/circul.jpg',
//             fit: BoxFit.cover, // يخلي الصورة تغطي الشاشة كاملة
//           ),
//         ),
//         // مستطيل عيد ميلاد
//         Positioned(
//           left: 0,
//           top: 100,
//           child: GestureDetector(
//             onTap: () => toggleEvent('birthday'),
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: expandedEvent == 'birthday' ? 200 : 90,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Color(0xff464646),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 children: [
//                   Text(
//                     "Birthday",
//                     style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
//                   ),
//                   if (expandedEvent == 'birthday') ...[
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             // Text("hello"),
//                             // SizedBox(width: 10),
//                             Image.asset('images/fawake.jpg',
//                                 width: 50, height: 80),
//                             MaterialButton(
//                               color: Colors.white,
//                               onPressed: () {},
//                               child: Text("Ok"),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ),

//         // مستطيل عرس
//         Positioned(
//           left: 0,
//           top: 220,
//           child: GestureDetector(
//             onTap: () => toggleEvent('wedding'),
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: expandedEvent == 'wedding' ? 250 : 95,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Color(0xff464646),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 children: [
//                   Text(
//                     "Wedding",
//                     style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
//                   ),
//                   if (expandedEvent == 'wedding') ...[
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             // Text('خطبة', style: TextStyle(color: Colors.white)),
//                             // SizedBox(width: 10),
//                             Image.asset('images/fawake.jpg',
//                                 width: 80, height: 80),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ),

//         // مستطيل خطبة
//         Positioned(
//           left: 0,
//           top: 340,
//           child: GestureDetector(
//             onTap: () => toggleEvent('engagement'),
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: expandedEvent == 'engagement' ? 250 : 95,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Color(0xff464646),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 children: [
//                   Text(
//                     "Engage",
//                     style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
//                   ),
//                   if (expandedEvent == 'engagement') ...[
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             // Text('خطبة', style: TextStyle(color: Colors.white)),
//                             // SizedBox(width: 10),
//                             Image.asset('images/fawake.jpg',
//                                 width: 80, height: 80),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 0,
//           bottom: 200,
//           child: GestureDetector(
//             onTap: () => toggleEvent('consolation'),
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: expandedEvent == 'consolation' ? 250 : 95,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Color(0xff464646),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 children: [
//                   Text(
//                     "Consola",
//                     style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
//                   ),
//                   if (expandedEvent == 'consolation') ...[
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             // Text('خطبة', style: TextStyle(color: Colors.white)),
//                             // SizedBox(width: 10),
//                             Image.asset('images/fawake.jpg',
//                                 width: 80, height: 80),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 0,
//           bottom: 80,
//           child: GestureDetector(
//             onTap: () => toggleEvent('graduation'),
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: expandedEvent == 'graduation' ? 250 : 95,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Color(0xff464646),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 children: [
//                   Text(
//                     "Graduat",
//                     style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
//                   ),
//                   if (expandedEvent == 'graduation') ...[
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             // Text('خطبة', style: TextStyle(color: Colors.white)),
//                             // SizedBox(width: 10),
//                             Image.asset('images/fawake.jpg',
//                                 width: 80, height: 80),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
