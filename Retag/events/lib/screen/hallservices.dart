import 'package:events/screen/hallowner.dart';
import 'package:events/screen/servicowner.dart';
import 'package:flutter/material.dart';

class Hallservices extends StatelessWidget {
  const Hallservices({super.key});

  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Row(
          children: [
            Container(
              color: Colors.white,
              height: disize.height,
              width: disize.width * .5,
            ),
            Container(
              color: Colors.purple,
              height: disize.height,
              width: disize.width * .5,
            ),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(75))),
              height: disize.height * .5,
              width: disize.width,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Hallowner()));
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 160,
                      height: 230,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "images/rest.jpg",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Places",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75))),
              height: disize.height * .5,
              width: disize.width,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Servicowner()));
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 160,
                      height: 230,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "images/mus.jpg",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Services",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
