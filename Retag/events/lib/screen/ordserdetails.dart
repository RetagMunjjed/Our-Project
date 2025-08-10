import 'package:events/screen/detailsdorder.dart';
import 'package:events/screen/detailsporder.dart';
import 'package:events/screen/detaishorder.dart';
import 'package:flutter/material.dart';

class Ordserdetails extends StatefulWidget {
  const Ordserdetails({super.key});

  @override
  State<Ordserdetails> createState() => _OrdserdetailsState();
}

class _OrdserdetailsState extends State<Ordserdetails> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Detailsporder(),
    Detaishorder(),
    Detailsdorder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // الشريط البنفسجي مع الحواف المنحنية على اليمين
          Container(
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 100),
                buildSideText("Details", 0),
                const SizedBox(height: 100),
                buildSideText("Halls", 1),
                const SizedBox(height: 100),
                buildSideText("Devices", 2),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: pages[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSideText(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        // حاوية للنص مع تحكم بالحواف الداخلية والخارجية
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )
            : null,
        child: RotatedBox(
          quarterTurns: -1, // تدوير 90 درجة عكس عقارب الساعة
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.purple : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
