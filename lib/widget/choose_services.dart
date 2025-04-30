import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'choose_type_of_specific_service.dart';

class ChooseServices extends StatelessWidget {
  const ChooseServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Choose the services you want to provide ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChooseTypeOfSpecificService()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: BorderDirectional(
                              top: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              start: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              end: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              bottom: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            )),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CarouselSlider(
                            items: [
                              Image(
                                image: AssetImage(
                                  'assets/images/images.jpg',
                                ),
                                fit: BoxFit.fill,
                                height: 200,
                                width: 400,
                              ),
                              Image(
                                image: AssetImage(
                                  'assets/images/shopping.webp',
                                ),
                                fit: BoxFit.fill,
                                height: 100,
                                width: 400,
                              ),
                            ],
                            options: CarouselOptions(
                                height: 200,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                reverse: false,
                                initialPage: 0,
                                viewportFraction: 1,
                                scrollDirection: Axis.horizontal,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration: Duration(seconds: 1),
                                autoPlayInterval: Duration(seconds: 3))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Decorations',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                itemCount: 15,
              )
            ])),
      ),
    );
  }
}
