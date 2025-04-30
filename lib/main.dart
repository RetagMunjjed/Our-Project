
import 'package:event/cache/cache_helper.dart';

import 'package:flutter/material.dart';
import 'widget/bottomnavigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     MaterialApp(
      home: MainScreen(),
    );
  }
}
