import 'package:flutter/material.dart';
import 'package:project_1/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()  {
    super.initState();
   Future.delayed(Duration(seconds: 5)).then((V){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAlFlbIg6UsLYnlL2hZZGrcvmSCkWl9bwy9kHzpuVZxQ&s"),
      ),
    );
  }
}
