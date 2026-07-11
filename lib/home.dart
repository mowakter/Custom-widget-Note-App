import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Home Page"),centerTitle: true,
      ),
      body: Center(
        child: Text("Congratulation",style: TextStyle(fontSize: 35,color: Colors.pinkAccent),),
      )
      );
  }
}
