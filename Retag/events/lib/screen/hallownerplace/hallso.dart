import 'package:events/screen/hallownerplace/addhall.dart';
import 'package:events/screen/hallownerplace/hallsodetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Hallso extends StatelessWidget {
  Hallso({super.key});

  List hall = [
    {
      "image": "images/farah.jpg",
      "title": "Name",
    },
    {
      "image": "images/farah.jpg",
      "title": "Name",
    },
    {
      "image": "images/farah.jpg",
      "title": "Name",
    },
    {
      "image": "images/farah.jpg",
      "title": "Name",
    },
    {
      "image": "images/farah.jpg",
      "title": "Name",
    },
    {
      "image": "images/farah.jpg",
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
          itemCount: hall.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, i) {
            if (i < hall.length) {
              // العناصر العادية
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Hallsodetails()),
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
                          hall[i]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              hall[i]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          MaterialButton(
                            minWidth: 0,
                            padding: EdgeInsets.all(0),
                            color: Colors.red,
                            shape: CircleBorder(),
                            onPressed: () {},
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
              // مربع الإضافة
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Addhall()));
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
    );
  }
}
