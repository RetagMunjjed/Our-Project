import 'package:flutter/material.dart';

import 'settings.dart';

class ProfileOfUser extends StatelessWidget {
  const ProfileOfUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              CircleAvatar(
                radius: 95,
                backgroundColor: Colors.grey,
                child: Center(
                    child: Icon(
                  Icons.person,
                  size: 90,
                  color: Colors.black26,
                )),
              ),
              CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.deepOrange,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        color: Colors.grey,
                      )))
            ]),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Naya',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'I only see my goals',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.phone,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '0965233424',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
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
              Column(
                children: [
                  Text(
                    'Email address',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'nayazwdt@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
