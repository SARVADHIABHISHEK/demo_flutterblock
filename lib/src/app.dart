import 'package:flutter/material.dart';
import '../custom_pain.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoCustomPaint(),
    );
  }
}
