import 'package:flutter/material.dart';
import 'package:untitled10/modules/bottomnavigation_bar.dart';
import 'package:untitled10/modules/choose_services.dart';
import 'package:untitled10/modules/onbording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    home: MainScreen(),
    );} }