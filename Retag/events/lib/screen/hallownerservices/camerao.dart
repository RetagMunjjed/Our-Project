import 'package:flutter/material.dart';
import 'package:events/screen/detailscafe.dart';

// ignore: must_be_immutable
class Camerao extends StatelessWidget {
  Camerao({super.key});

  List camera = [
    {
      "title": "Name",
    },
    {
      "title": "Name",
    },
    {
      "title": "Name",
    },
    {
      "title": "Name",
    },
    {
      "title": "Name",
    },
    {
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
          itemCount: camera.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3,
          ),
          itemBuilder: (context, i) {
            if (i < camera.length) {
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          camera[i]['title'],
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
