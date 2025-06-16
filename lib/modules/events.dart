
import 'package:flutter/material.dart';
import 'package:untitled10/modules/places.dart';

// ignore: must_be_immutable
class Events extends StatelessWidget {
  Events({super.key});
  List event = [
    {
      "image": "assets/images/shopping.webp",
      "title": "Name",
    },
    {
      "image": "assets/images/shopping.webp",
      "title": "Name",
    },
    {
      "image": "assets/images/shopping.webp",
      "title": "Name",
    },
    {
      "image": "assets/images/shopping.webp",
      "title": "Name",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff8f5fb),
      child:
      Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 45,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Events',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: event.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.grey[200],
                        child: Image.asset(
                          event[i]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              event[i]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30)),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Places()),
                              );
                            },
                            child: Text(
                              "This",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
