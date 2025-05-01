import 'package:events/screen/places.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resturants extends StatefulWidget {
  Resturants({super.key});

  @override
  State<Resturants> createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  bool isFavorite = false;
  List rest = [
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
    {
      "image": "images/rest.jpg",
      "title": "Name",
      "location": "mazzeh",
      "price": "400\$"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffdb1a1),
        title: Text("Resturants"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: rest.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0, // تعديل المسافة بين الأعمدة
                  childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع
                ),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Places()),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity, // استخدام العرض الكامل
                            height: 100,
                            color: Colors.grey[200],
                            child: Image.asset(
                              rest[i]['image'],
                              height: 120,
                              fit: BoxFit
                                  .cover, // استخدم BoxFit.cover للحفاظ على نسبة العرض
                            ),
                          ),
                          MaterialButton(
                            color: Color(0xfffdb1a1),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Description",
                                    style: TextStyle(color: Color(0xfffdb1a1)),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(rest[i]['title']),
                                      Text(rest[i]["location"]),
                                      Text(rest[i]['price']),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text("Description"),
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "Time",
                                        style:
                                            TextStyle(color: Color(0xfffdb1a1)),
                                      ),
                                      content: Column(
                                        children: [],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text("Time"),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite =
                                        !isFavorite; // عكس الحالة عند الضغط
                                  });
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          )
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
