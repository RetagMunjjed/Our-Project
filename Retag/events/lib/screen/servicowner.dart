import 'package:events/screen/hallownerservices/camerao.dart';
import 'package:events/screen/hallownerservices/designo.dart';
import 'package:events/screen/hallownerservices/foodo.dart';
import 'package:events/screen/hallownerservices/musio.dart';
import 'package:flutter/material.dart';

class Servicowner extends StatelessWidget {
  const Servicowner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 4,
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
                    "Food",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Design",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Music",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: TabBarView(children: [
                Foodo(),
                Designo(),
                Musio(),
                Camerao(),
              ]),
            ),
          )),
    );
  }
}
