import 'package:events/screen/cafes.dart';
import 'package:events/screen/halls.dart';
import 'package:events/screen/houses.dart';
import 'package:events/screen/resturants.dart';
import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                height: disize.height,
                width: disize.width * .5,
              ),
              Container(
                color: Color(0xfffdb1a1),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
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
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        "BIRTHDAY",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffdb1a1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xfffdb1a1),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(75))),
                  height: disize.height * .5,
                  width: disize.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            width: 300,
                            height: 400,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/saade.jpg",
                                  width: 250,
                                  height: 300,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Halls()));
                                    },
                                    child: Text(
                                      "Hall",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            )),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                            width: 300,
                            height: 400,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/rest.jpg",
                                  width: 250,
                                  height: 300,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Resturants()));
                                    },
                                    child: Text(
                                      "Restuarant",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            )),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                            width: 300,
                            height: 400,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/cafe.jpg",
                                  width: 250,
                                  height: 300,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Cafes()));
                                    },
                                    child: Text(
                                      "Cafe",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            )),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                            width: 300,
                            height: 400,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/hous.jpg",
                                  width: 250,
                                  height: 300,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Houses()));
                                    },
                                    child: Text(
                                      "Hous",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            )),
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
