import 'package:flutter/material.dart';

class AppColor {
  static Color pink = Color(0xfffdb1a1);
  static Color blue = Color(0xff262739);
}

/*
import 'package:events/screen/places.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  String? expandedEvent; // قيمتها: 'birthday', 'wedding', 'engagement'

  void toggleEvent(String eventName) {
    setState(() {
      if (expandedEvent == eventName) {
        expandedEvent = null; // إغلاق إذا ضغط مرة ثانية
      } else {
        expandedEvent = eventName; // فتح الحدث المطلوب وإغلاق الباقي
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'images/backgroundd.jpg',
            fit: BoxFit.cover, // يخلي الصورة تغطي الشاشة كاملة
          ),
        ),
        // مستطيل عيد ميلاد
        Positioned(
          left: 0,
          top: 100,
          child: GestureDetector(
            onTap: () => toggleEvent('birthday'),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: expandedEvent == 'birthday' ? 200 : 110,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xfffdb1a1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: [
                  Text(
                    "Birthday",
                    style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
                  ),
                  if (expandedEvent == 'birthday') ...[
                    SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Places()));
                              },
                              child: Text("Ok"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // مستطيل عرس
        Positioned(
          left: 0,
          top: 220,
          child: GestureDetector(
            onTap: () => toggleEvent('wedding'),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: expandedEvent == 'wedding' ? 200 : 110,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xfffdb1a1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Text(
                    "Wedding",
                    style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
                  ),
                  if (expandedEvent == 'wedding') ...[
                    SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Text("Ok"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // مستطيل خطبة
        Positioned(
          left: 0,
          top: 340,
          child: GestureDetector(
            onTap: () => toggleEvent('engagement'),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: expandedEvent == 'engagement' ? 200 : 110,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xfffdb1a1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Text(
                    "Engage",
                    style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
                  ),
                  if (expandedEvent == 'engagement') ...[
                    SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Text("Ok"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 200,
          child: GestureDetector(
            onTap: () => toggleEvent('consolation'),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: expandedEvent == 'consolation' ? 200 : 110,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xfffdb1a1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Text(
                    "Consola",
                    style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
                  ),
                  if (expandedEvent == 'consolation') ...[
                    SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Text("Ok"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 80,
          child: GestureDetector(
            onTap: () => toggleEvent('graduation'),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: expandedEvent == 'graduation' ? 200 : 110,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xfffdb1a1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Text(
                    "Graduat",
                    style: TextStyle(color: Color(0xfff5e5aa), fontSize: 20),
                  ),
                  if (expandedEvent == 'graduation') ...[
                    SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Text("Ok"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

 */