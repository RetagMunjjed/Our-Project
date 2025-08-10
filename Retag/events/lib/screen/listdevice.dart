import 'package:flutter/material.dart';

class Listdevice extends StatelessWidget {
  final List<Map<String, dynamic>> cardsData = [
    {
      'title': 'ورد جوري ',
      'price': '20 باقة',
      'image': 'images/rest.jpg',
      "place": "فوق الطاولات بالنص",
      'colors': [Color(0xFFFFA726), Color(0xFFFFCC80)],
    },
    {
      'title': 'ورد ياسمين',
      'price': '15 باقة',
      'image': 'images/rest.jpg',
      "place": "على الممر من الباب لعد العروس",
      'colors': [Color(0xFFAB47BC), Color(0xFFE1BEE7)],
    },
    {
      'title': 'ورد جوري ',
      'price': '20 باقة',
      'image': 'images/rest.jpg',
      "place": "فوق الطاولات بالنص",
      'colors': [Color(0xFFFFA726), Color(0xFFFFCC80)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEFF2),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: ListView.builder(
          itemCount: cardsData.length,
          itemBuilder: (context, index) {
            final card = cardsData[index];
            return Container(
              width: double.infinity,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding:
                  EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: card['colors'],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: card['colors'][0].withOpacity(0.4),
                    blurRadius: 12,
                    offset: Offset(4, 6),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      image: DecorationImage(
                        image: AssetImage(card['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          card['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          card['price'],
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          card['place'],
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
