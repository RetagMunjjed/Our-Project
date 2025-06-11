
import 'package:flutter/material.dart';
import 'package:untitled10/modules/reservation.dart';

// ignore: must_be_immutable
class Detailscamera extends StatelessWidget {
  Detailscamera({super.key});
  List exam = [
    {"image": "images/andal.jpg"},
    {"image": "images/andal.jpg"},
    {"image": "images/andal.jpg"},
    {"image": "images/andal.jpg"},
    {"image": "images/andal.jpg"},
    {"image": "images/andal.jpg"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Man"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // لضمان عدم الالتصاق بحواف الشاشة
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Type of camera :",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: Card(
                    child: Text(
                      "soni",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Photography forms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: exam.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0, // تعديل المسافة بين الأعمدة
                  childAspectRatio: 1.0, // نسبة العرض إلى الارتفاع
                ),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity, // استخدام العرض الكامل
                            height: 110,
                            color: Colors.grey[200],
                            child: Image.asset(
                              exam[i]['image'],
                              height: 80,
                              fit: BoxFit
                                  .cover, // استخدم BoxFit.cover للحفاظ على نسبة العرض
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
                    "Choose",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
