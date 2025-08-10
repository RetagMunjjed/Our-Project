import 'package:events/screen/hallownerplace/cafeo.dart';
import 'package:events/screen/hallownerplace/hallso.dart';
import 'package:events/screen/hallownerplace/resturanto.dart';
import 'package:flutter/material.dart';

class Hallowner extends StatelessWidget {
  const Hallowner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
              bottom: TabBar(tabs: [
                Tab(
                  child: Text(
                    "Halls",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Cafe",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Resturant",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: TabBarView(children: [
                Hallso(),
                Cafeo(),
                Resturanto(),
              ]),
            ),
          )),
    );
  }
}
