import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35
                ),
                SizedBox(
                  width: 40,
                ),
                Text( 'Setting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Change email address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.phonelink_setup_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Change phone number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.password_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Two_step verification',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.delete_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Delete account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.language_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'App language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.edit_attributes_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Change theme',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),

    );
  }
}
