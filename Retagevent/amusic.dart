import 'package:events/core/api/const/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Amusic extends StatefulWidget {
  Amusic({super.key});

  @override
  State<Amusic> createState() => _EmusicState();
}

class _EmusicState extends State<Amusic> {
  bool music1 = false;

  bool music2 = false;

  bool music3 = false;

  bool music4 = false;

  bool music5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/mus.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 55,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(60),
              child: Column(
                children: [
                  Text(
                    "Choose Music",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      title: Text("Dont you Give up"),
                      value: music1,
                      onChanged: (val) {
                        setState(() {
                          music1 = val!;
                        });
                      }),
                  CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      title: Text("Dont you Give up"),
                      value: music2,
                      onChanged: (val) {
                        setState(() {
                          music2 = val!;
                        });
                      }),
                  CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      title: Text("Dont you Give up"),
                      value: music3,
                      onChanged: (val) {
                        setState(() {
                          music3 = val!;
                        });
                      }),
                  CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      title: Text("Dont you Give up"),
                      value: music4,
                      onChanged: (val) {
                        setState(() {
                          music4 = val!;
                        });
                      }),
                  CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      title: Text("Dont you Give up"),
                      value: music5,
                      onChanged: (val) {
                        setState(() {
                          music5 = val!;
                        });
                      }),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: AppColor.blue,
                        onPressed: () {},
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: AppColor.blue,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 300,
                                  height: 400,
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Inter information about song:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 40),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "Songer : ",
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColor.pink,
                                                  width: 3)),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "Song : ",
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColor.pink,
                                                  width: 3)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Colors.black,
                                        onPressed: () {},
                                        child: Text(
                                          "ok",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "I want another music",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
