import 'package:events/screen/hallownerplace/addresturant.dart';
import 'package:events/screen/hallownerplace/resturantodetails.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resturanto extends StatelessWidget {
  Resturanto({super.key});
  List resturant = [
    {
      "image": "images/rest.jpg",
      "title": "Name",
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: resturant.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0, // تعديل المسافة بين الأعمدة
                  childAspectRatio: 0.9, // نسبة العرض إلى الارتفاع
                ),
                itemBuilder: (context, i) {
                  if (i < resturant.length) {
                    // العناصر العادية
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Resturantodetails()),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              color: Colors.grey[200],
                              child: Image.asset(
                                resturant[i]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    resturant[i]['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),

                                // المسافة اليمنى والسفلية
                                MaterialButton(
                                  minWidth: 0,
                                  padding: EdgeInsets.all(0),
                                  color: Colors.red,
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    // تنفيذ الحذف إذا رغبت لاحقًا
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Addresturant()));
                      },
                      child: Card(
                        color: Colors.grey[100],
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 50,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
