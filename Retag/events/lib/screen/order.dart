import 'package:events/screen/ordserdetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Order extends StatelessWidget {
  Order({super.key});

  List order = [
    {
      "name": "Retag",
      "subt": "ask you to organize his event",
      "icon": Icon(Icons.arrow_forward)
    },
    {
      "name": "Naya",
      "subt": "ask you to organize his event",
      "icon": Icon(Icons.arrow_forward)
    },
    {
      "name": "Ahmad",
      "subt": "ask you to organize his event",
      "icon": Icon(Icons.arrow_forward)
    },
    {
      "name": "Hasan",
      "subt": "ask you to organize his event",
      "icon": Icon(Icons.arrow_forward)
    },
  ];

  // قائمة الألوان
  List<Color> cardColors = [
    Colors.blue.shade50,
    Colors.green.shade50,
    Colors.orange.shade50,
    Colors.purple.shade50,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.list),
            SizedBox(width: 120),
            Text(
              "Orders",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, i) {
          return Container(
            width: 500,
            height: 90,
            child: Card(
              color: cardColors[i % cardColors.length], // لون خاص لكل Card
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order[i]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          order[i]["subt"],
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Ordserdetails()));
                    },
                    icon: order[i]["icon"],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
