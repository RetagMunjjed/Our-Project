import 'package:flutter/material.dart';
import 'package:events/screen/detailscafe.dart';

// ignore: must_be_immutable
class Designo extends StatelessWidget {
  Designo({super.key});

  List flour = [
    {
      "image": "images/flour.jpg",
      "title": "Name",
    },
    {
      "image": "images/flour.jpg",
      "title": "Name",
    },
    {
      "image": "images/flour.jpg",
      "title": "Name",
    },
    {
      "image": "images/flour.jpg",
      "title": "Name",
    },
    {
      "image": "images/flour.jpg",
      "title": "Name",
    },
    {
      "image": "images/flour.jpg",
      "title": "Name",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: flour.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, i) {
            if (i < flour.length) {
              // العناصر العادية
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Detailscafe()),
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
                          flour[i]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          flour[i]['title'],
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
            } else {
              // مربع الإضافة
              return InkWell(
                onTap: () {},
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
    );
  }
}
