import 'package:events/core/api/const/color.dart';
import 'package:events/screen/edit.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blue,
          title: Text("Profile", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 154, 149, 149),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 150,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "full name",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(238, 158, 158, 158)))),
              ),
            ),
            Container(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "email",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(238, 158, 158, 158)))),
              ),
            ),
            Container(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.blue,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "password",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(238, 158, 158, 158)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: AppColor.blue,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Edit()));
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
