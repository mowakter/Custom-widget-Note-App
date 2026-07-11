import 'package:flutter/material.dart';
import 'package:project_1/home.dart';
import 'package:project_1/login.dart';
import 'package:project_1/reg.dart';
import 'package:project_1/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
 }