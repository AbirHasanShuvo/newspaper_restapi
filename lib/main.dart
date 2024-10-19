import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper/home_screen/home_screen.dart';
import 'package:newspaper/p_screen/p_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PScreen(),
    );
  }
}
