import 'package:events/core/api/const/color.dart';
import 'package:events/screen/camera.dart';
import 'package:events/screen/music.dart';
import 'package:events/screen/reservation.dart';
import 'package:flutter/material.dart';

class Detailscafe extends StatelessWidget {
  Detailscafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Text("صفحة القاعة"),
            SizedBox(
              width: 90,
            ),
            Icon(Icons.share),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Image.asset("images/rest.jpg"),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    "images/rest.jpg",
                    width: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/rest.jpg",
                    width: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/rest.jpg",
                    width: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/rest.jpg",
                    width: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/rest.jpg",
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
                Icon(Icons.message_outlined),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.phone),
                SizedBox(
                  width: 100,
                ),
                Container(
                  width: 90,
                  height: 30,
                  child: Card(
                    child: Text("   Birthday"),
                  ),
                ),
                Container(
                  width: 90,
                  height: 30,
                  child: Card(
                    child: Text("   happy"),
                  ),
                )
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
                      onTap: () {},
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
                      onTap: () {},
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
                        "images/sale.jpg",
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
                        "images/sale.jpg",
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
                        "images/sale.jpg",
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
                  color: AppColor.blue,
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
                  color: AppColor.blue,
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
  }
}
