import 'package:flutter/material.dart';

class Detaishorder extends StatelessWidget {
  const Detaishorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // الجزء العلوي (نصف الدائرة + الصورة)
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: ClipOval(
                  child: Container(
                    width: 190,
                    height: 190,
                    color: Colors.white,
                    child: Image.asset(
                      "images/rest.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // المعلومات تحت الصورة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    " Hall Name",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
                    ),
                  ),
                ),

                SizedBox(height: 50),

                Row(
                  children: [
                    Icon(Icons.place, color: Colors.purple),
                    SizedBox(width: 8),
                    Text(
                      "Location",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // وقت الحجز
                Row(
                  children: [
                    Icon(Icons.people, color: Colors.purple),
                    SizedBox(width: 4),
                    Text(
                      " guests",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // وقت الحجز
                Row(
                  children: [
                    Icon(Icons.alarm, color: Colors.purple),
                    SizedBox(width: 8),
                    Text(
                      "Reservation",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
