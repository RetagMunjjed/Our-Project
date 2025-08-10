import 'package:events/screen/amusic.dart';
import 'package:events/screen/emusic.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Musio extends StatelessWidget {
  Musio({super.key});
  List music = [
    {
      "image": "images/dj.jpg",
      "title": "Name",
    },
    {
      "image": "images/dj.jpg",
      "title": "Name",
    },
    {
      "image": "images/dj.jpg",
      "title": "Name",
    },
    {
      "image": "images/dj.jpg",
      "title": "Name",
    },
    {
      "image": "images/dj.jpg",
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
                itemCount: music.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0, // تعديل المسافة بين الأعمدة
                  childAspectRatio: 1.0, // نسبة العرض إلى الارتفاع
                ),
                itemBuilder: (context, i) {
                  if (i == music.length) {
                    // عنصر الإضافة
                    return InkWell(
                      onTap: () {
                        // هنا تضيف الكود اللي يفتح صفحة أو نافذة لإضافة عنصر جديد
                        // مثال: طباعة أو نافذة مؤقتة
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("إضافة DJ جديدة"),
                            content: Text("هنا يمكنك تنفيذ منطق الإضافة."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("إغلاق"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 40, color: Colors.grey),
                            SizedBox(height: 10),
                            Text("إضافة",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  }

                  // العناصر العادية
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              width: 300,
                              height: 200,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Music Type",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Emusic()));
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("English",
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Amusic()));
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("عربية",
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 110,
                            color: Colors.grey[200],
                            child: Image.asset(
                              music[i]['image'],
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              music[i]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
